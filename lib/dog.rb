class Dog < ActiveRecord::Base

  has_one :adoption
  delegate :buyer, :to => :adoption


  def self.not_special
    self.where(disabled: false)
  end

end
