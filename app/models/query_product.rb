class QueryProduct < ApplicationRecord
	has_many :orders
  validates :title, :description, :price, :capacity, :status, presence: true
	enum :status, [:in_stock, :out_of_stock, :comming_soon]
	default_scope { where(is_active: true) }
end
