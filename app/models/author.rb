class Author < ApplicationRecord
    
    has_many :books , dependent: :destroy
    has_many :images, as: :imageable
    validates :first_name, :last_name, :date_of_birth, :email, presence: true
    validates :email, uniqueness: true
    validates :first_name, :last_name, length: {minimum:2, maximum:50 , message: "You can write minimum 2 letters and maximum 50 letters" }
    validate  :verify_name 
    
    private
        def verify_name
            self.first_name, self.last_name = first_name.strip, last_name.strip    
            
            if first_name.match(/^[a-zA-Z]+$/) || last_name.match(/^[a-zA-Z]+$/)
                self.first_name, self.last_name = first_name.capitalize, last_name.capitalize                        
            else 
                 errors.add(:name , "Name will allow only letters.") 
            end
        end

        def destroy_author
            puts "Product is destroy."
        end

        def print_notice
            puts "Checking data..."
        end
    
        def print_status
            puts "Data added sucessfully."
        end  
end
