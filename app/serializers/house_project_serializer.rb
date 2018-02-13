class HouseProjectSerializer < ActiveModel::Serializer
  attributes :id
  has_many :projects, serializer: ProjectSerializer
end
