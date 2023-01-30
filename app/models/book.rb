class Book < ApplicationRecord
    belongs_to :author
    has_many :images, as: :imageable
    
    validates :name, :price, presence: true
    validates :name, length: {minimum:2, maximum:50 , message: "You can write minimum 2 letters and maximum 50 letters" }
    validate  :verify_space

    
    private
        def verify_space
             self.name = name.strip    
        end

end 
