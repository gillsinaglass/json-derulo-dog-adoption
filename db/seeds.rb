
Breed.destroy_all
Dog.destroy_all
Adoption.destroy_all

afghan_hound = {name: "Afghan Hound", weight: "45-60", height: "25-30in", temperament: "Young, wild, and free", breed_group: "Hound", life_expectancy: "10-14 years", min_price: 30.00, max_price: 40.00}

affenpinscher = {name: "Affenpinscher", weight: "6 - 13", height: "9 - 11.5in", temperament: "Stubborn, Curious, Playful, Adventurous, Active, Fun-loving", breed_group: "Toy", life_expectancy: "10-12 years", min_price: 100.00, max_price: 300.00}

bull_terrior = {"name": "Bull Terrier", "weight":"50 - 70", "height": "21 - 22", "breed_group": "Terrier","life_expectancy": "10 - 12 years", "temperament": "Trainable, Protective, Sweet-Tempered, Keen, Active", min_price: 400.00, max_price: 700.00}

Breed.create_and_save(afghan_hound)
Breed.create_and_save(affenpinscher)
Breed.create_and_save(bull_terrior)

ralph = Dog.create_and_save(name: "Ralph", breed_id: "1", age: 3, price: 35.00, disabled: false)
hank = Dog.create_and_save(name: "Hank", breed_id: "3", age: 1, price: 500, disabled: false)
sparky = Dog.create_and_save(name: "Sparky", breed_id: "2", age: 2, price: 250, disabled: true)
