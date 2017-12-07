class Project < ActiveRecord::Base
  belongs_to :house
  has_many :areas, through: :house
  has_many :items
  has_many :materials, through: :items
end
