class Book < ApplicationRecord
    validates :name, presence: true
    validates :name, length: {minimum:2, maximum:50 , message: "You can write minimum 2 letters and maximum 50 letters" }
    validate  :verify_space
    
    private
        def verify_space
            self.first_name, self.last_name = first_name.strip, last_name.strip    
        end

end
