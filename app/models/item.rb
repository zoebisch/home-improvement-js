class Item < ApplicationRecord
  belongs_to :project
  belongs_to :material

  def print_material
    " #{Material.find(self.material_id).name}, quantity: #{self.quantity}"
  end
end
