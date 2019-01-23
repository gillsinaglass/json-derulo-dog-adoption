
i = 1
10.times do
  dog = Dog.create(name: "Dog #{i}")
  dog.save
  if i.odd?
    dog.update(special_needs: false)
    dog.save
  end
  i += 1
end
