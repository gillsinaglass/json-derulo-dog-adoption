class AddDogColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :sex, :string
    remove_column :dogs, :price
  end
end
