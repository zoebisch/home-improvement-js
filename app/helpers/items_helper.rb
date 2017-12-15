module ItemsHelper

  def material_lookup(item)
    material = Material.find(item.material_id)
    binding.pry
    if item.quantity == nil
      #TODO this shouldn't happen. An item should be vailidated with quantity.
      item.quantity = 0
      item.save
    end
    link_to "#{material.name}, quantity needed: #{item.quantity}", material_path(material.id)
  end

end
