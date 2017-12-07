class Material < ActiveRecord::Base
  has_many :items
  has_many :projects, through: :items
end
