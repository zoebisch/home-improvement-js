class ItemSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :project
  belongs_to :material
end
