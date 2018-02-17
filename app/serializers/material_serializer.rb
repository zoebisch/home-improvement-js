class MaterialSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity_on_hand
  has_many :items
end
