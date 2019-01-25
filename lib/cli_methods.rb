class Cli

  attr_accessor :user, :name, :answer, :prompt, :disableq, :valid_dogs, :valid_disability
  attr_accessor :ageq, :valid_age, :groupq, :valid_group, :location, :sizeq, :valid_size



  def initialize # begins the cli
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
    @location = nil
    @answer = nil
    @disableq = []
    @ageq = []
    @groupq = []
    @sizeq = []
    @valid_disability = []
    @valid_age = []
    @valid_group = []
    @valid_size = []
    @valid_dogs = []

    @prompt = TTY::Prompt.new
  end

  def ask_location # gets a zip code from the user
    self.location = prompt.ask("What is your zip code?") do |q|
      q.required true
      q.validate /^\d+$/
    end
  end

  def ask_name # gets a name from the user
    self.name = prompt.ask("What is your name?") do |q|
      q.required true
      q.validate /\A\w+\Z/
      q.modify   :capitalize
    end
  end

  def login # creates a new instance of the user class based on the user's name
    self.user = Buyer.find_or_create_by(name: self.name)
    self.user.save
    puts "\nHi, #{self.user.name}!"
  end


  def prompt_menu # main menu
    puts "\n"
    choices = {'Adopt a new dog' => 1, 'Exit' => 2}
    self.answer = self.prompt.select("What would you like to do?", choices)
    self.act
  end

  def act # acts based upon the answer of the menu prompt
    if self.answer == 1
      self.adopt_dog
      self.prompt_menu
    elsif self.answer == 2
      self.user.show_adoptions
      self.goodbye
    end
  end

  def adopt_dog # runs through the process of choosing and adopting a dog & lets the user know which dog they've adopted
    self.disableq = self.attribute_question({'Not disabled': 1, 'Disabled': 2})
    self.disabled
    self.sizeq = self.attribute_question({'Small': 1, 'Medium': 2, 'Large': 3, 'Extra Large': 4})
    self.size
    self.ageq = self.attribute_question({'Puppy': 1, 'Adult': 2, 'Senior': 3})
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

  def clear_search_results # clears the search results so each new search starts clean
    self.valid_disability.clear
    self.valid_age.clear
    self.valid_group.clear
    self.valid_dogs.clear
    self.true_valid_dogs.clear
    self.valid_size.clear
  end

  def attribute_question(choices) # creates a prompt for an attribute option
    self.prompt.multi_select("Please select the type(s) of dog you want.", choices)
  end

  def disabled # acts upon the results of the disability prompt.
    if self.disableq.include?(1) # adds the non-disabled dogs to the valid dogs arrays
      if Dog.not_special != nil
        Dog.not_special.each do |dog|
          self.valid_dogs << dog
          self.valid_disability << dog
        end
      end
    end
    if self.disableq.include?(2) # adds the disabled dogs to the valid dogs arrays
      if Dog.special != nil
        Dog.special.each do |dog|
          self.valid_dogs << dog
          self.valid_disability << dog
        end
      end
    end
  end

  def size # acts upon the results of the size prompt
    if self.sizeq.include?(1) # adds the small dogs to the valid dogs arrays
      if Dog.smalls != nil
        Dog.smalls.each do |dog|
          self.valid_dogs << dog
          self.valid_size << dog
        end
      end
    end
    if self.sizeq.include?(2) # adds the medium dogs to the valid dogs arrays
      if Dog.mediums != nil
        Dog.mediums.each do |dog|
          self.valid_dogs << dog
          self.valid_size << dog
        end
      end
    end
    if self.sizeq.include?(3) # adds the large dogs to the valid dogs arrays
      if Dog.larges != nil
        Dog.larges.each do |dog|
          self.valid_dogs << dog
          self.valid_size << dog
        end
      end
    end
    if self.sizeq.include?(4) # adds the extra large dogs to the valid dogs arrays
      if Dog.xls != nil
        Dog.xls.each do |dog|
          self.valid_dogs << dog
          self.valid_size << dog
        end
      end
    end
  end

  def age # acts upon the age prompt
    if self.ageq.include?(1) # adds the puppies to the valid dogs arrays
      if Dog.puppies != nil
        Dog.puppies.each do |dog|
          self.valid_dogs << dog
          self.valid_age << dog
        end
      end
    end
    if self.ageq.include?(2) # adds the adult dogs to the valid dogs arrays
      if Dog.adults != nil
        Dog.adults.each do |dog|
          self.valid_dogs << dog
          self.valid_age << dog
        end
      end
    end
    if self.ageq.include?(3) # adds the senior dogs to the valid dogs arrays
      if Dog.olds != nil
        Dog.olds.each do |dog|
          self.valid_dogs << dog
          self.valid_age << dog
        end
      end
    end
  end

  def group # acts upon the group prompt
    if self.groupq.include?(1) # adds the toy dogs to the valid dogs arrays
      if Dog.toys != nil
        Dog.toys.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(2) # adds the hound dogs to the valid dogs arrays
      if Dog.hounds != nil
        Dog.hounds.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(3) # adds the terrier dogs to the valid dogs arrays
      if Dog.terriers != nil
        Dog.terriers.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(4) # adds the working dogs to the valid dogs arrays
      if Dog.workings != nil
        Dog.workings.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(5) # adds the mixed dogs to the valid dogs arrays
      if Dog.mixeds != nil
        Dog.mixeds.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(6) # adds the non-sporting dogs to the valid dogs arrays
      if Dog.non_sportings != nil
        Dog.non_sportings.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(7) # adds the sporting dogs to the valid dogs arrays
      if Dog.sportings != nil
        Dog.sportings.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
    if self.groupq.include?(8) # adds the herding dogs to the valid dogs arrays
      if Dog.herdings != nil
        Dog.herdings.each do |dog|
          self.valid_dogs << dog
          self.valid_group << dog
        end
      end
    end
  end

  def true_valid_dogs # combines the results of all of the adoption prompts and deletes duplicates
    if self.valid_dogs != []
      dogs = self.valid_dogs.uniq
      dogs.select do |a|
        Adoption.dogs.exclude?(a) && self.valid_disability.include?(a) && self.valid_group.include?(a) && self.valid_age.include?(a) && self.valid_size.include?(a)
      end
    else
      []
    end
  end


  def show_valid_dogs # displays the results of the adoption search
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
        puts "  size: #{dog.size}"
      end
    end
  end

  def dog_names # displays the options for which dog to adopt
    if self.true_valid_dogs != nil
      self.true_valid_dogs.collect do |dog|
        dog.name
      end
    end
  end

  def choose_dog # asks a user to choose a dog to adopt
    self.prompt.select("\nChoose a dog to adopt.", self.dog_names)
  end

  def goodbye # displays a closing message
    puts "\nThank you for choosing JSON Derulo Dog Adoption Agency!"
  end

end
