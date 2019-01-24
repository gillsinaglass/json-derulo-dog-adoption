require 'net/http'
require 'open-uri'
require 'json'

Breed.destroy_all
Dog.destroy_all
Adoption.destroy_all

# afghan_hound = {name: "Afghan Hound", weight: "45-60", height: "25-30in", temperament: "Young, wild, and free", breed_group: "Hound", life_expectancy: "10-14 years", min_price: 30.00, max_price: 40.00}
#
# affenpinscher = {name: "Affenpinscher", weight: "6 - 13", height: "9 - 11.5in", temperament: "Stubborn, Curious, Playful, Adventurous, Active, Fun-loving", breed_group: "Toy", life_expectancy: "10-12 years", min_price: 100.00, max_price: 300.00}
#
# bull_terrior = {"name": "Bull Terrier", "weight":"50 - 70", "height": "21 - 22", "breed_group": "Terrier","life_expectancy": "10 - 12 years", "temperament": "Trainable, Protective, Sweet-Tempered, Keen, Active", min_price: 400.00, max_price: 700.00}
#
# Breed.create_and_save(afghan_hound)
# Breed.create_and_save(affenpinscher)
# Breed.create_and_save(bull_terrior)

ralph = Dog.create_and_save(name: "Ralph", breed_id: "1", age: 3, price: 35.00, disabled: false)
hank = Dog.create_and_save(name: "Hank", breed_id: "3", age: 1, price: 500, disabled: false)
sparky = Dog.create_and_save(name: "Sparky", breed_id: "2", age: 2, price: 250, disabled: true)


# class API
#
#   url = "https://api.thedogapi.com/v1/breeds?"
#   uri = URI.parse(url)
#   request = Net::HTTP::Get.new(uri)
#   request["Accept"] = "application/json"
#
#   req_options = {
#     use_ssl: uri.scheme == "https",
#   }
#
#   response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#     http.request(request)
#   end
#   json = JSON.parse(response.body)
#   json.each do |breed|
#     self.create_breeds(breed)
#   end
#
#   def self.create_breeds(breed)
#     breed_hash = {}
#     breed_hash[:name] = breed["name"]
#     breed_hash[:weight] = breed["weight"]["imperial"]
#     breed_hash[:height] = breed["height"]["imperial"]
#     breed_hash[:temperament] = breed["temperament"]
#     breed_hash[:breed_group] = breed["breed_group"]
#     breed_hash[:life_expectancy] = breed["life_expectancy"]
#
#     breed = Breed.find_or_create_by(breed_hash)
#     breed.save
#   end
#
# end
#
# puts Breed.all
# hash = json
# hash.each do |breed|
#   name = breed["name"]
#   weight = breed["weight"]["imperial"]
#   height = breed["height"]["imperial"]
#   temperament = breed["temperament"]
#   breed_group = breed["breed_group"]
#   life_expectancy = breed["life_expectancy"]
# end
# end
# binding.pry
# Breed.find_or_create_by(name: name ,weight: weight, height: height, temperament: temperament, breed_group: breed_group, life_expectancy: life_expectancy)
#
# binding.pry
# 0
# class GetBreed
#
#   URL = "https://api.thedogapi.com/v1/breeds?"
#
#   def get_breeds
#     uri = URI.parse(URL)
#     response = Net::HTTP.get_response(uri)
#     response.body
#   end
#
#   def parse_JSON
#     breeds = JSON.parse(response.body)
#     binding.
#   end
# end
#
#
# breeds = GetBreed.new.get_breeds
# hash = breeds.parse_JSON
# hash.each do |breed|
#   name = breed["name"]
#   weight = breed["weight"]["imperial"]
#   height = breed["height"]["imperial"]
#   temperament = breed["temperament"]
#   breed_group = breed["breed_group"]
#   life_expectancy = breed["life_expectancy"]
# end
# Breed.find_or_create_by(name: name ,weight: weight, height: height, temperament: temperament, breed_group: breed_group, life_expectancy: life_expectancy)
