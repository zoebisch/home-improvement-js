class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :status, :default => "not started"

      t.timestamps
    end
  end
end
