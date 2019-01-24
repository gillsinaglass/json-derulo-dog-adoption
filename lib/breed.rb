class Breed < ActiveRecord::Base
  has_many :dogs
  delegate :adoption, :to => :dogs

  # def self.create_and_save(hash)
  #   breed = Breed.create(hash)
  #   breed.save
  # end

end
