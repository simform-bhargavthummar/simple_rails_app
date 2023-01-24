class Product < ApplicationRecord
    validates :company_name , presence: true
    validates :name , presence: true
    validates :price , presence: true
    validates :quantity , presence: true
    validates :description , presence: true , length: {minimum:3, maximum:200}


    before_validation :print_notice
    after_save :print_status
    
    
    def print_notice
        puts "Checking data..."
    end

    def print_status
        puts "Data added sucessfully."
    end

    # Date : 24-jan work
    
end
