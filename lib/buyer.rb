class Buyer < ActiveRecord::Base
  has_many :adoptions
  has_many :dogs, through: :adoptions

  def adopt(dog_name) # creates a new adoption with self as buyer and dog as a certain dog
    dog = Dog.find_by(name: dog_name)
    ad = Adoption.new(buyer: self, dog: dog, time: Time.now)
    ad.save
  end

  def show_adoptions # displays the dogs that the user has adopted
    puts "\n"
    if self.adoptions == []
      puts "You haven't adopted any dogs."
    else
      self.adoptions.each do |adoption|
        puts "You adopted #{adoption.dog.name} on #{adoption.time}.\n"
      end
    end
  end

  # def show_dogs(array)
  #   array.all.each do |dog|
  #     puts dog.name
  #     puts "age: #{dog.age}"
  #     puts "height: #{dog.height}"
  #     puts "weight: #{dog.weight}"
  #     puts "height: #{dog.height}"
  #     puts "breed: #{dog.breed}"
  #   end
  # end


  # def adopt_dog
  #   puts "\nGreat! Are you okay with a special needs dog?(y/n)"
  #   s = gets.chomp
  #   puts "\nThe dogs available to you are:"
  #   if s == "y"
  #     Dog.all.each do |dog|
  #       puts dog.name
  #     end
  #   elsif s == "n"
  #     Dog.not_special.each do |dog|
  #       puts dog.name
  #     end
  #   end
  #   puts "\nPlease enter the name of the dog you would like to adopt."
  #   chosen_one = gets.chomp
  #   self.adopt(chosen_one)
  #   puts "\nYou have adopted #{chosen_one}!"
  #   binding.pry
  # end



end
