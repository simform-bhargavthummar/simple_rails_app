class OrderRoute < ApplicationRecord
  belongs_to :product_route
  validates :quantity, :total, presence: true
end
