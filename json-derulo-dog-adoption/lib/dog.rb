class Dog < ActiveRecord::Base

  has_one :adoption
  delegate :buyer, :to => :adoption


  def self.not_special
    self.where(special_needs: false)
  end

end
