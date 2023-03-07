class Car < ApplicationRecord
  validates :name, :color, :price, :average, presence: true
  validates :price, :average, numericality: true 
end
