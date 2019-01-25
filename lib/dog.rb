class Dog < ActiveRecord::Base

  has_one :adoption
  belongs_to :breed
  delegate :buyer, :to => :adoption



  def self.not_special # selects all the dogs that aren't disabled
    self.all.where(disabled: false)
  end

  def self.special # selects all the dogs that are disabled
    self.all.where(disabled: true)
  end

  def self.puppies # selects all the dogs that are babies or young
    self.all.select do |dog|
      dog.age == "Baby" || dog.age == "Young"
    end
  end

  def self.adults # selects all the dogs that are adults
    self.all.where(age: "Adult")
  end

  def self.olds # selects all the dogs that are seniors
    self.all.where(age: "Senior")
  end

  def self.smalls # selects all the dogs with a small size
    self.all.where(size: "S")
  end

  def self.mediums # selects all the dogs with a medium size
    self.all.where(size: "M")
  end

  def self.larges # selects all the dogs with a large size
    self.all.where(size: "L")
  end

  def self.xls # selects all the dogs with an extra large size
    self.all.where(size: "XL")
  end

  def self.toys # selects all the dogs in the toy breed group
    self.all.select do |dog|
      dog.breed.breed_group == 'Toy'
    end
  end

  def self.hounds # selects all the dogs in the hound breed group
    self.all.select do |dog|
      dog.breed.breed_group == 'Hound'
    end
  end

  def self.terriers # selects all the dogs in the terrier breed group
    self.all.select do |dog|
      dog.breed.breed_group == 'Terrier'
    end
  end

  def self.workings # selects all the dogs in the working breed group
    self.all.select do |dog|
      dog.breed.breed_group == 'Working'
    end
  end

  def self.mixeds # selects all the dogs in the mixed breed group
    self.all.select do |dog|
      dog.breed.breed_group == 'Mixed'
    end
  end

  def self.non_sportings # selects all the dogs in the non-sporting breed group
    self.all.select do |dog|
      dog.breed.breed_group == 'Non-Sporting'
    end
  end

  def self.sportings # selects all the dogs in the sporting breed group
    self.all.select do |dog|
      dog.breed.breed_group == 'Sporting'
    end
  end

  def self.herdings # selects all the dogs in the herding breed group
    self.all.select do |dog|
      dog.breed.breed_group == 'Herding'
    end
  end

  # def self.display_dogs(array)
  #   array.all.each do |dog|
  #     puts dog.name
  #     puts "age: #{dog.age}"
  #     puts "height: #{dog.height}"
  #     puts "weight: #{dog.weight}"
  #     puts "height: #{dog.height}"
  #     puts "breed: #{dog.breed}"
  #   end
  # end

end
