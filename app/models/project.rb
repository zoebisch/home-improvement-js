class Project < ActiveRecord::Base
  belongs_to :house
  has_many :areas, through: :house
  has_many :items
  has_many :materials, through: :items

  def add_material(material_id, quantity)
    material = Material.find_by(id: material_id)
    binding.pry
    if material.quantity_on_hand < quantity
      #TODO: error if not enough materials on hand
    else
      binding.pry
      self.materials << material
      self.save
    end
    material
  end
end
