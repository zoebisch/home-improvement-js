class Item < ApplicationRecord
  belongs_to :project
  belongs_to :material

  def check_material
    binding.pry
  end
end
