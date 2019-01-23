class Dog < ActiveRecord::Base

  has_one :adoption
  belongs_to :breed
  delegate :buyer, :to => :adoption


  def self.not_special
    self.where(disabled: false)
  end

  def self.create_and_save(hash)
    dog = Dog.new(hash)
    dog.save
  end

end
