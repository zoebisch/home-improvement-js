class House < ApplicationRecord
  has_many :projects
  validates :address, presence: true
  validates :address, uniqueness: true
end
