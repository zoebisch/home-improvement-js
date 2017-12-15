class Project < ApplicationRecord
  belongs_to :house
  has_many :areas, through: :house
  has_many :items
  has_many :materials, through: :items
  validates :name, presence: true
  validates :name, uniqueness: true

  def items_attributes=(items_attributes)
     items_attributes.values.each do |item|
       self.add_item(item[:material], item[:quantity])
     end

  end

  def add_item(material_name, quantity)
    material = Material.find_or_create_by(name: material_name.downcase)
    if material.quantity_on_hand < quantity.to_i
      #TODO: error if not enough materials on hand
    else
    #  binding.pry
      if self.items.exists?(material.id)
        item = self.items.find(material.id)
        item.quantity += quantity
      else
        item = self.items.new(material_id: material.id)
        item.quantity = quantity.to_i
      end
    end
    item.save
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
