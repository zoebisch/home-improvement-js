module MaterialsHelper

  def material_qoh(material_id)
    Material.find(material_id).quantity_on_hand
  end
  
end
