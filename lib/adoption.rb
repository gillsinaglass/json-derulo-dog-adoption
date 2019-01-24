class Adoption < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :dog

  # attr_reader :date, :dog, :buyer
  #
  # @@all = []
  #
  # def initialize(date, buyer, dog)
  #   @date = date
  #   @dog = dog
  #   @buyer = buyer
  #   @@all << self
  # end

  def self.dogs
    self.all.collect do |a|
      a.dog
    end
  end
end
