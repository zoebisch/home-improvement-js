class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.integer :quantity_on_hand, :default => 0
      t.string :unit
      t.float :value_per_unit

      t.timestamps
    end
  end
end
