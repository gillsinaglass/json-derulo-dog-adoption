class Qapi #added q to force other models to load prior to this class

  def self.get_breeds

    url = "https://api.thedogapi.com/v1/breeds?"
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
    json.each do |breed|
      self.create_breeds(breed)
      binding.pry
    end
  end
  def self.create_breeds(breed)
    breed_hash = {}
    breed_hash[:name] = breed["name"]
    breed_hash[:weight] = breed["weight"]["imperial"]
    breed_hash[:height] = breed["height"]["imperial"]
    breed_hash[:temperament] = breed["temperament"]
    breed_hash[:breed_group] = breed["breed_group"]
    breed_hash[:life_expectancy] = breed["life_span"]

    breed = Breed.find_or_create_by(breed_hash)
    breed.save
  end

end
