require 'net/http'
require 'open-uri'
require 'json'

Breed.destroy_all
Dog.destroy_all
Adoption.destroy_all


ralph = Dog.create_and_save(name: "Ralph", breed_id: "1", age: 3, price: 35.0, disabled: false)
hank = Dog.create_and_save(name: "Hank", breed_id: "3", age: 1, price: 500.0, disabled: false)
sparky = Dog.create_and_save(name: "Sparky", breed_id: "2", age: 8, price: 250.0, disabled: true)

Breed.all
