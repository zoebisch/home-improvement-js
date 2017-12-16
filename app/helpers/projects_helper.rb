module ProjectsHelper

  def item_name(item)
    Material.find(item.object.id).name
  end

end
