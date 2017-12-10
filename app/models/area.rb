class Area < ApplicationRecord
  belongs_to :house
  validates :name, presence: true
end
