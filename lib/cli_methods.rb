class Cli

  attr_accessor :user, :name, :answer, :prompt, :disability, :valid_dogs, :valid_disability
  attr_accessor :ageq, :valid_age, :groupq, :valid_group



  def initialize
    puts "_______________________________________________________________________________
        __     __       __     _     _      _____
        /    /    )   /    )   /|   /       /    )                      /
-------/-----\\-------/----/---/-| -/-------/----/----__---)__----------/----__-
      /       \\     /    /   /  | /       /    /   /___) /   ) /   /  /   /   )
_(___/____(____/___(____/___/___|/_______/____/___(___ _/_____(___(__/___(___/_"
    puts "   _                           _
 /_/  _/  _   _ _/_.  _  _   /_/  _  _  _  _
/ / /_/ /_/ /_/ / / /_// /  / / /_//_'/ //_ /_/
           /                    _/          _/ "
    @user = nil
    @name = nil
    @answer = nil
    @disability = []
    @ageq = []
    @groupq = []
    @valid_disability = []
    @valid_age = []
    @valid_group = []
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
    self.ageq = self.attribute_question({'Puppy': 1, 'Middle-aged dog': 2, 'Old dog': 3})
    self.age
    self.groupq = self.attribute_question({'Toy': 1, 'Hound': 2, 'Terrier': 3, 'Working': 4, 'Mixed': 5, 'Non-Sporting': 6, 'Sporting': 7, 'Herding': 8})
    self.group
    self.show_valid_dogs
    if self.true_valid_dogs != []
      dog_name = self.choose_dog
      self.user.adopt(dog_name)
      puts "\nYou have adopted #{dog_name}!"
    end
    self.clear_search_results
  end

  def clear_search_results
    self.valid_disability.clear
    self.valid_age.clear
    self.valid_group.clear
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
          self.valid_disability << dog
        end
      end
    end
    if self.disability.include?(2)
      if Dog.special != nil
        Dog.special.each do |dog|
          self.valid_dogs << dog
          self.valid_disability << dog
        end
      end
    end
  end

  def age
    if self.ageq.include?(1)
      if Dog.puppies != nil
        Dog.puppies.each do |dog|
          self.valid_dogs << dog
          self.valid_age << dog
        end
      end
    end
    if self.ageq.include?(2)
      if Dog.adults != nil
        Dog.adults.each do |dog|
          self.valid_dogs << dog
          self.valid_age << dog
        end
      end
    end
    if self.ageq.include?(3)
      if Dog.olds != nil
        Dog.olds.each do |dog|
          self.valid_dogs << dog
          self.valid_age << dog
        end
      end
    end
  end

  def group
    if self.groupq.include?(1)
      if Dog.toys != nil
        Dog.toys.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(2)
      if Dog.hounds != nil
        Dog.hounds.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(3)
      if Dog.terriers != nil
        Dog.terriers.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(4)
      if Dog.workings != nil
        Dog.workings.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(5)
      if Dog.mixeds != nil
        Dog.mixeds.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(6)
      if Dog.non_sportings != nil
        Dog.non_sportings.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(7)
      if Dog.sportings != nil
        Dog.sportings.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(8)
      if Dog.herdings != nil
        Dog.herdings.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
  end

  def true_valid_dogs
    if self.valid_dogs != []
      dogs = self.valid_dogs.uniq
      dogs.select do |a|
        Adoption.dogs.exclude?(a) && self.valid_disability.include?(a) && self.valid_age.include?(a) && self.valid_group.include?(a)
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
        puts "  age: #{dog.age}"
        puts "  breed: #{dog.breed.name}"
        puts "  disabled?: #{dog.disabled}"
        puts "  temperament: #{dog.breed.temperament}"
        puts "  height: #{dog.breed.height} inches"
        puts "  weight: #{dog.breed.weight} punds"
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
    self.prompt.select("\nChoose a dog to adopt.", self.dog_names)
  end

  def check_dog_breed_attributes

  end

  def goodbye
    puts "\nThank you for choosing JSON Derulo Dog Adoption Agency!"
  end

end
