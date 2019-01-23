require_relative '../config/environment'


puts "\n\n\n\n\n\n"

puts "Welcome to JSON Derulo's Dog Adoption Agency! \n"
puts "\nWhat is your name?"

name = gets.chomp

user = Buyer.create(name: name)

puts "\nHi, #{name}."
answer = nil
while answer != "3"
  puts "Please type the number for one of the following commands:"
  puts "\n1. View Past Adoptions"
  puts "2. Find a Dog to Adopt"
  puts "3. Exit"
  puts "\n"

  answer = gets.chomp

  if answer == "1"
    user.show_adoptions
    puts "\nPress enter to continue"
    gets.chomp
  elsif answer == "2"
    user.adopt_prompt
    puts "\nPress enter to continue"
    gets.chomp
  end
end

puts "\nThank you for choosing JSON Derulo's Dog Adoption Agency!"
if answer == "n"
  puts "\nCome back soon!"
elsif answer == "y"
  puts "\nGreat! Are you okay with a special needs dog?(y/n)"
  s = gets.chomp
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
  user.adopt(chosen_one)
  puts "\nYou have adopted #{chosen_one}!"

end
