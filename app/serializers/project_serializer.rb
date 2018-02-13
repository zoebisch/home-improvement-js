class ProjectSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :house, serializer: HouseProjectSerializer
end
