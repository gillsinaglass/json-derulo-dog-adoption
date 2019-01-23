class CreateBreeds < ActiveRecord::Migration[5.2]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :weight
      t.string :height
      t.string :temperament
      t.string :breed_group
      t.string :life_expectancy
      t.float :min_price
      t.float :max_price
    end
  end
end
