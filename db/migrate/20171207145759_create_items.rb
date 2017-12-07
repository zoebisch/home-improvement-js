class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.material_id :integer
      t.project_id :integer

      t.timestamps
    end
  end
end
