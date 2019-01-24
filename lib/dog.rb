class Dog < ActiveRecord::Base

  has_one :adoption
  belongs_to :breed
  delegate :buyer, :to => :adoption



  def self.not_special
    self.all.where(disabled: false)
  end

  def self.special
    self.all.where(disabled: true)
  end

  def self.create_and_save(hash)
    dog = Dog.new(hash)
    dog.save
  end

  def self.expensive
    self.all.select do |dog|
<<<<<<< HEAD
     dog.price > 200.0
   end
=======
      dog.price > 200.0
    end
>>>>>>> 79694be248feaca85bb373de0e0f179eff29306a
  end

  def self.cheap
    self.all.select do |dog|
<<<<<<< HEAD
     dog.price < 200.0
   end
  end

  def get_dog_breed
    return breed_info
    binding.pry
=======
      dog.price < 200.0
    end
  end

  def self.puppies
    self.all.select do |dog|
      dog.age <= 1
    end
  end

  def self.adults
    self.all.select do |dog|
      dog.age > 1 && dog.age < 7
    end
  end

  def self.olds
    self.all.select do |dog|
      dog.age >= 7
    end
  end

  def self.toys
    self.all.select do |dog|
      dog.breed.breed_group == 'Toy'
    end
  end

  def self.hounds
    self.all.select do |dog|
      dog.breed.breed_group == 'Hound'
    end
  end

  def self.terriers
    self.all.select do |dog|
      dog.breed.breed_group == 'Terrier'
    end
  end

  def self.workings
    self.all.select do |dog|
      dog.breed.breed_group == 'Working'
    end
  end

  def self.mixeds
    self.all.select do |dog|
      dog.breed.breed_group == 'Mixed'
    end
  end

  def self.non_sportings
    self.all.select do |dog|
      dog.breed.breed_group == 'Non-Sporting'
    end
  end

  def self.sportings
    self.all.select do |dog|
      dog.breed.breed_group == 'Sporting'
    end
  end

  def self.herdings
    self.all.select do |dog|
      dog.breed.breed_group == 'Herding'
    end
>>>>>>> 79694be248feaca85bb373de0e0f179eff29306a
  end

  # def self.display_dogs(array)
  #   array.all.each do |dog|
  #     puts dog.name
  #     puts "age: #{dog.age}"
  #     puts "height: #{dog.height}"
  #     puts "weight: #{dog.weight}"
  #     puts "height: #{dog.height}"
  #     puts "price: #{dog.price}"
  #     puts "breed: #{dog.breed}"
  #   end
  # end

end
