class Customer < ApplicationRecord
    validates :first_name, :last_name, :email, :phone_number, presence: true
    validates :email, uniqueness: true
    validates :phone_number, numericality: true
    has_many :orders
    def query_product
        QueryProduct.unscoped {super}
    end 
    
end
