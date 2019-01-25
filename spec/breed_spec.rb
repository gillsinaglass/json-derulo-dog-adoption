
require_relative '../config/environment.rb'

describe Breed do

 let (:porgi) {Breed.create(name: "Porgi", breed_group: "mutant")}

 it 'contains name' do
   expect(porgi.name == "Porgi")
 end
end
