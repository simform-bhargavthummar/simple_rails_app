class Order < ApplicationRecord
    belongs_to :customer
    belongs_to :query_product
    enum :status, [:booked, :cancelled]
    def query_product
        QueryProduct.unscoped {super}
    end 
end
