class Buyer < ActiveRecord::Base
  has_many :adoptions
  has_many :dogs, through: :adoptions

  # attr_reader :name
  #
  # def initialize(name)
  #   @name = name
  # end
  #
  # def adoptions
  #   Adoption.all.select do |a|
  #     a.buyer == self
  #   end
  # end
  #
  # def dogs
  #   self.adoptions.collect do |a|
  #     a.dog
  #   end
  # end
  #
  def adopt(dog_name)
    dog = Dog.find_by(name: dog_name)
    ad = Adoption.new(buyer: self, dog: dog)
    ad.save
  end

  def show_adoptions
    puts "\n"
    if self.adoptions == []
      puts "You haven't adopted any dogs."
    else
      self.adoptions.all.each do |adoption|
        puts "You own #{adoption.dog.name}.\n"
      end
    end
  end

  def adopt_prompt
    puts "\nGreat! Are you okay with a special needs dog?(y/n)"
    s = gets.chomp
    puts "\nThe dogs available to you are:"
    if s == "y"
      Dog.all.each do |dog|
        puts dog.name
      end
    elsif s == "n"
      Dog.not_special.each do |dog|
        puts dog.name
      end
    end
    puts "\nPlease enter the name of the dog you would like to adopt."
    chosen_one = gets.chomp
    self.adopt(chosen_one)
    puts "\nYou have adopted #{chosen_one}!"
  end



end
