class Project < ApplicationRecord
  belongs_to :house
  has_many :areas, through: :house
  has_many :items
  has_many :materials, through: :items
  #validates :name, presence: true
  #validates :name, uniqueness: true

  def items_attributes=(items_attributes)
     items_attributes.values.each do |item|
       self.add_material(item[:material], item[:quantity])
     end

  end

  def add_material(material_name, quantity)
    material = Material.find_or_create_by(name: material_name.downcase)
    if material.quantity_on_hand < quantity.to_i
      #TODO: error if not enough materials on hand
    else
      binding.pry
      if self.items == nil || self.items.find(material.id)
        item = self.items.find(material.id)
        item.quantity += quantity
        item.save
      else
        item = Item.new(material_id: material.id)
        item.quantity = quantity.to_i
        self.items << item
      end
    end
    binding.pry
    self.save
    item
  end

  def set_status(status)
    self.status = status
    self.save
  end

  def list_materials
    materials_list = self.items.collect{|item| Material.find(item.material_id)}
    self.items.each do |item|
    end
    binding.pry
  end

end
