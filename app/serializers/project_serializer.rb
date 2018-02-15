class ProjectSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :house
  has_many :items
end
