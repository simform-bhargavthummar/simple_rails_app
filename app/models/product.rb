class Product < ApplicationRecord

    validates :name, :company_name, :price, :quantity, :description , presence: true
    validates :description, length: {minimum:3, maximum:200 , message: "You have to add minimum 3 letters and maximum 200 words in this." }
    validates :price, numericality: true                            
    validates :quantity, numericality: { only_integer: true }       #It will accept only integer value
    validate :check_name 

    before_validation :print_notice
    after_destroy :destroy_product
    after_save :print_status
    
    private
        def check_name
            if name.match(/^[0-9]/)
                errors.add(:base , "Product name should be start with letters")
            else
                self.name = name.strip          #It will remove white space from start
                self.name = name.capitalize     #It will capital first letter of name
            end
        end

        def destroy_product
            puts "Product is destroy."
        end

        def print_notice
            puts "Checking data..."
        end
    
        def print_status
            puts "Data added sucessfully."
        end  
end
