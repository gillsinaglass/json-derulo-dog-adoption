class AddCurrentTimeToAdoption < ActiveRecord::Migration[5.2]
  def change
    add_column :adoptions, :time, :datetime
  end
end
