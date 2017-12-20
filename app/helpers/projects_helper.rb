module ProjectsHelper

  def item_name(item)
    Material.find(item.object.id).name
  end

  def build_items_list
    Material.all.each do |material|
      @project.items.new(material_id: material.id)
    end
  end

  def show_materials_shortage
    binding.pry
  end

end
