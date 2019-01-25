
require_relative '../config/environment.rb'

describe Breed do

 let (:porgi) {Breed.create(name: "Porgi", breed_group: "mutant")}
 let (:german_shep) {Breed.create(name: "German Shepherd", breed_group: "Herding")}
 let (:puggle) {Breed.create(name: "Puggle", temperament: "great, but dead")}

   it 'contains name' do
     expect(porgi.name == "Porgi")
   end

   it 'contains breed group' do
     expect(german_shep.breed_group == "Herding")
   end

   it 'contains breed temperament' do
     expect(puggle.temperament == "great, but dead")
   end

end
