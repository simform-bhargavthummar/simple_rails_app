class ProductLayout < ApplicationRecord
  has_many :order_layouts, dependent: :destroy
  validates :name, :description, :price, presence: true
  validates :price, numericality: true
end
