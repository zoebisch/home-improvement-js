module ItemsHelper

  def material_lookup(item)
    material = Material.find(item.material_id)
    if item.quantity == nil
      #TODO this shouldn't happen. An item should be vailidated with quantity.
      item.quantity = 0
      item.save
    end
    link_to "#{material.name}, quantity needed: #{item.quantity}", material_path(material.id)
  end

  def find_material_name(items_builder)
    Material.find(items_builder.object.material_id).name
  end

  def item_quantity(item_id)
    if item_id != nil
      item = Item.find(item_id)
      item.quantity == nil ? 0 : item.quantity
    else
      0
    end
  end

end
