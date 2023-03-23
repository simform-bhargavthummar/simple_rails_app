class ProductRoute < ApplicationRecord
  has_many :order_routes
  validates :title, :price, :company_name, presence: true
end
