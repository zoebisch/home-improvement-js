module MaterialsHelper

  def material_qoh(material_id)
    Material.find(material_id).quantity_on_hand
  end

  def material_being_used?
    if Project.all.find_all{|project| project.materials.include?(@material)} == []
      link_to "Remove #{@material.name}",  material_path(@material), method: :delete
    end
  end

end
