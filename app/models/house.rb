class House < ApplicationRecord
  has_many :areas
  has_many :projects
  validates :address, presence: true
  validates :address, uniqueness: true
end
