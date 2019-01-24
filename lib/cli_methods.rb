class Cli

  attr_accessor :user, :name, :answer, :prompt, :price, :disability, :valid_dogs



  def initialize
    puts "_______________________________________________________________________________
        __     __       __     _     _      _____
        /    /    )   /    )   /|   /       /    )                      /
-------/-----\\-------/----/---/-| -/-------/----/----__---)__----------/----__-
      /       \\     /    /   /  | /       /    /   /___) /   ) /   /  /   /   )
_(___/____(____/___(____/___/___|/_______/____/___(___ _/_____(___(__/___(___/_"
    puts "   _                          _
 /_/  _/ _   _  _/_ . _  _   /_/ _  _  _  _
/ / /_/ /_/ /_//  / /_// / / / /_//_'/ //_ /_/
           /                   _/          _/ "
    @user = nil
    @name = nil
    @answer = nil
    @price = []
    @disability = []
    @valid_dogs = []
    @prompt = TTY::Prompt.new
  end

  def ask_name
    self.name = prompt.ask("What is your name?") do |q|
      q.required true
      q.validate /\A\w+\Z/
      q.modify   :capitalize
    end
  end

  def login
    self.user = Buyer.find_or_create_by(name: self.name)
    self.user.save
    puts "\nHi, #{self.user.name}!"
  end


  def prompt_menu
    puts "\n"
    choices = {'Adopt a new dog' => 1, 'Exit' => 2}
    self.answer = self.prompt.select("What would you like to do?", choices)
    self.act
  end

  def act
    if self.answer == 1
      self.adopt_dog
      self.prompt_menu
    elsif self.answer == 2
      self.user.show_adoptions
      self.goodbye
    end
  end

  def adopt_dog
    self.disability = self.attribute_question({'Not disabled': 1, 'Disabled': 2})
    self.disabled
    self.price = self.attribute_question({'less than $200': 1, '$200 or more': 2})
    self.cost
    self.show_valid_dogs
    if self.true_valid_dogs != []
      dog_name = self.choose_dog
      self.user.adopt(dog_name)
      puts "\nYou have adopted #{dog_name}!"
    end
    self.valid_dogs.clear
    self.true_valid_dogs
  end

  def attribute_question(choices)
    self.prompt.multi_select("Please select the type(s) of dog you want.", choices)
  end

  def disabled
    if self.disability.include?(1)
      if Dog.not_special != nil
        Dog.not_special.each do |dog|
          self.valid_dogs << dog
        end
      end
    end
    if self.disability.include?(2)
      if Dog.special != nil
        Dog.special.each do |dog|
          self.valid_dogs << dog
        end
      end
    end
  end

  def cost
    if self.price.include?(1)
      if Dog.cheap != nil
        Dog.cheap.each do |dog|
          self.valid_dogs << dog
        end
      end
    end
    if self.price.include?(2)
      if Dog.expensive != nil
        Dog.expensive.each do |dog|
          self.valid_dogs << dog
        end
      end
    end
  end

  def true_valid_dogs
    if self.valid_dogs != []
      dogs = self.valid_dogs.uniq
      dogs.select do |a|
        Adoption.dogs.exclude?(a)
        binding.pry
      end
    end
  end


  def show_valid_dogs
    if self.true_valid_dogs == nil || self.true_valid_dogs == []
      puts "\nSorry, no pups matched your search!"
    else
      puts "\nThese are the dogs that are available to you:"
      self.true_valid_dogs.each do |dog|
        puts "\n#{dog.name}"
        puts "age: #{dog.age}"
        puts "price: #{dog.price}"
        puts "breed: #{dog.breed.name}"
      end
    end
  end

  def dog_names
    if self.true_valid_dogs != nil
      self.true_valid_dogs.collect do |dog|
        dog.name
      end
    end
  end

  def choose_dog
    self.prompt.select("Choose a dog to adopt.", self.dog_names)
  end

  def check_dog_breed_attributes

  end

  def goodbye
    puts "\nThank you for choosing JSON Derulo's Dog Adoption Agency!"
  end

end
