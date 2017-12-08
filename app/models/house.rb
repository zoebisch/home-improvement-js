class House < ApplicationRecord
  has_many :areas
  has_many :projects
end
