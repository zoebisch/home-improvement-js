class Item < ApplicationRecord
  belongs_to :project
  belongs_to :material

  def adjust_quantity(id,quantity)
    item = Item.find(id)

  end
end
