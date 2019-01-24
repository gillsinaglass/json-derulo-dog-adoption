class ChangeAgeToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :age
    add_column :dogs, :age, :string
  end
end
