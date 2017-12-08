class Project < ActiveRecord::Base
  belongs_to :house
  has_many :areas, through: :house
  has_many :items
  has_many :materials, through: :items

  def add_material(material_id, quantity)
    binding.pry
    material = Material.find(material_id)
    if material.quantity_on_hand < quantity
      #TODO: error if not enough materials on hand
    else
      item = Item.new(material_id: material_id)
      item.quantity = quantity
      self.items << item
      self.save
      binding.pry
    end
    item
  end
end
