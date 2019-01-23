require 'pry'


def palindrome(string)
  array = string.split('')
  array2 = array.select do |elem|
    elem != " "
  end
  puts array2 == array2.reverse
end

palindrome("taco cat")
palindrome("racecar")
palindrome("other")
