class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :breed_id
      t.integer :age
      t.float :price
      t.boolean :disabled
    end
  end
end
