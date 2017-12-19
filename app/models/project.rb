class Project < ApplicationRecord
  belongs_to :house
  has_many :areas, through: :house
  has_many :items
  has_many :materials, through: :items
  validates :name, presence: true
  validates :name, uniqueness: true

  def materials=(material_hash)
    if material_hash[:name] != ""
      material = Material.find_or_create_by(name: material_hash[:name])
      material.quantity_on_hand = material_hash[:quantity_on_hand].to_i
      material.save
      self.add_item(material.id, material.quantity_on_hand)
    end
  end

  def items_attributes=(items_attributes)
     items_attributes.values.each do |item|
       self.add_item(item[:material_id], item[:quantity])
     end
  end

  def add_item(material_id, quantity)
    quantity = quantity.to_i

    if quantity > 0
      material = Material.find(material_id)

      if self.items.exists?(material_id: material_id)
        item = self.items.find_by(material_id: material_id)
      else
        item = self.items.new(material_id: material_id)
      end

      item.quantity = quantity
      item.save
    else

      if self.materials.exists?(material_id)
        item = self.items.find_by(material_id: material_id)
        self.items.delete(item)
      end
    end

    self.save
  end

  def set_status(status)
    self.status = status
    self.save
  end

  def list_materials
    if material.quantity_on_hand < quantity.to_i
      #TODO: error if not enough materials on hand
      binding.pry
    end
    materials_list = self.items.collect{|item| Material.find(item.material_id)}
    self.items.each do |item|
    end
  end

  def build_items_list
    Material.all.each do |material|
      if !self.materials.exists?(material.id) #Only build item if not already included
        self.items.new(material_id: material.id)
      end
    end
  end

end
