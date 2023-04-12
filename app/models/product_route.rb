class ProductRoute < ApplicationRecord
  has_many :order_routes, dependent: :destroy
  validates :title, :price, :company_name, presence: true
  validates :price, numericality: { only_integer: true }
end
