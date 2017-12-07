class House < ActiveRecord::Base
  has_many :areas
  has_many :projects
end
