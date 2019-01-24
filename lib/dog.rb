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
     dog.price > 200.0
   end
  end

  def self.cheap
    self.all.select do |dog|
     dog.price < 200.0
   end
  end

  def get_dog_breed
    return breed_info
    binding.pry
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
