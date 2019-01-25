require_relative '../config/environment.rb'

describe Dog do

 let (:antwon) {Dog.create(name: "Antwon", age: "Adult")}
 let (:chichi) {Dog.create(name: "Chi Chi", age: "Senior")}
 let (:broken) {Dog.create(name: "Broken", disabled: true)}

   it 'contains name' do
     expect(antwon.name == "Antwon")
   end

   it 'contains age' do
     expect(chichi.age == "Senior")
   end

   it 'contains disability status' do
     expect(broken.disabled == true)
   end

end
