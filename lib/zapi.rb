class Zapi

  def self.get_pet_by_location(location = 22201)
    url = "http://api.petfinder.com/pet.find?key=5e5659c7c4e98c435e3054ba7a51454a&animal=dog&format=json&location=#{location}"
    uri = URI.parse(url)
    request = Net::HTTP::Get.new(uri)
    request["Accept"] = "application/json"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    json = JSON.parse(response.body)
    json = json["petfinder"]["pets"]["pet"]
    json.each do |dog|
      self.create_dogs(dog)
    end
  end

  def self.create_dogs(dog)
    dog_hash = {}
    dog_hash[:name] = dog["name"]["$t"]
    dog_hash[:breed_id] = self.breed_id(dog["breeds"]["breed"])
    dog_hash[:age] = dog["age"]["$t"]
    dog_hash[:sex] = dog["sex"]["$t"]
    dog_hash[:size] = dog["size"]["$t"]
    dog_hash[:disabled] = self.special_needs(dog)
    # dog_hash[:dog_group] = dog["dog_group"]
    # dog_hash[:life_expectancy] = dog["life_span"]

    dog = Dog.find_or_create_by(dog_hash)
    dog.save
  end

  def self.special_needs(dog)
    if dog["sex"]["$t"] == "F"
      return true
    else
      return false
    end
  end

  def self.breed_id(breed_pf)
    if breed_pf.kind_of?(Array)
      breed = Breed.all.sample
      breed.id
    else
      variable = Breed.all.find do |breed|
        breed.name == breed_pf["$t"]
      end
      if variable.nil?
         breed = Breed.all.sample
         breed.id
      else
        variable.id
      end
    end
  end

end
