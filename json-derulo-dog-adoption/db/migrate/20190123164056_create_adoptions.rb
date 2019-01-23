class CreateAdoptions < ActiveRecord::Migration[5.2]
  def change
    create_table :adoptions do |t|
      t.datetime
      t.integer :buyer_id
      t.integer :dog_id
    end
  end
end
