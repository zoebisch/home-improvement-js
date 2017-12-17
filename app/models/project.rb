class Project < ApplicationRecord
  belongs_to :house
  has_many :areas, through: :house
  has_many :items
  has_many :materials, through: :items
  validates :name, presence: true
  validates :name, uniqueness: true

  def materials=(material_hash)
    if material_hash[:name] != ""
      material = Material.find_or_create_by(material_hash)
      binding.pry
      self.add_item(material.id, material.quantity_on_hand)
    end
  end

  def items_attributes=(items_attributes)
     items_attributes.values.each do |item|
       self.add_item(item[:material_id], item[:quantity])
     end
  end

  def add_item(material_id, quantity)
    if quantity.to_i > 0 || quantity.to_i == ""
      puts "#{material_id} #{quantity}"
      binding.pry

      material = Material.find(material_id)
      if material.quantity_on_hand < quantity.to_i
        #TODO: error if not enough materials on hand
      else
        if self.items.exists?(material_id)
          item = self.items.find(material_id)
        else
          item = self.items.new(material_id: material_id)
        end
      end
      item.quantity = quantity.to_i
      item.save
      self.save
      item
    else
      if self.materials.exists?(material_id)
        item = self.items.find_by(material_id: material_id)
        self.items.delete(item)
        self.save
      end
    end
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

  def build_items_list
    Material.all.each do |material|
      self.items.new(material_id: material.id)
    end
  end

end
