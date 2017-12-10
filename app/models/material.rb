class Material < ApplicationRecord
  has_many :items
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :quantity_on_hand, presence: true
end
