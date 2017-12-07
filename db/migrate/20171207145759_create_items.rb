class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :material_id
      t.integer :project_id

      t.timestamps
    end
  end
end
