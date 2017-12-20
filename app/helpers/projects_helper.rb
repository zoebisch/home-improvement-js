module ProjectsHelper

  def item_name(item)
    Material.find(item.object.id).name
  end

  def build_items_list
    Material.all.each do |material|
      @project.items.new(material_id: material.id)
    end
  end

  def show_materials_shortage(project)
    items_list = []
    project.items.each do |item|
      material = Material.find(item.material_id)
      if material.quantity_on_hand < item.quantity
        items_list << "#{item.quantity} #{material.name} needed, #{material.quantity_on_hand} on hand"
      end
    end
    items_list
  end

end
