class AddHouseIdToAreas < ActiveRecord::Migration[5.1]
  def change
    add_column :areas, :house_id, :integer
  end
end
