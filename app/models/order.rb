class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :query_product
    validates :quantity, :total_price, :status, presence: true
    enum :status, [:booked, :cancelled]
    def query_product
        QueryProduct.unscoped {super}
    end 
end
