class Breed < ActiveRecord::Base
  has_many :dogs
  delegate :adoption, :to => :dogs

  # def self.create_and_save(hash)
  #   breed = Breed.create(hash)
  #   breed.save
  # end

  def self.groups # collects all of the breed groups
    self.all.collect do |breed|
      breed.breed_group
    end
  end

  def self.create_groups # assigns a group to the breeds that don't already have groups
    no_group = self.all.select {|breed| breed.breed_group == nil}
    no_group.each do |breed|
      breed.breed_group = "Mixed"
      breed.save
    end
  end

end
