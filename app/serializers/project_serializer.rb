class ProjectSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :house
end
