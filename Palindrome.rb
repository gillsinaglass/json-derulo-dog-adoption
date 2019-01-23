require 'pry'


def palindrome(string)
  array = string.split('')
  array2 = array.select do |elem|
    elem != " "
  end
  puts array2 == array2.reverse
end

def palindrome?(string)
  if string.is_a?(Integer)
    string = string.to_s
  end
  string = string.gsub(" ","")
  if string.length == 1 || string.length == 0
    true
  else
    if string[0] == string[-1]
      palindrome?(string[1..-2])
    else
      false
    end
  end
end

puts palindrome?("taco cat")
puts palindrome?("racecar")
puts palindrome?("other")
puts palindrome?("mellow    wollem")
puts palindrome?(123454321)
