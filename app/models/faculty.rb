class Faculty < ApplicationRecord
    validates :first_name, :last_name, :phone_number, :email, :designation, presence: true    #all the fields must have to present  
    validates :dob, comparison: { less_than: Date.today }  
    validates :phone_number, numericality: { only_integer: true, message: "Only 10 digit will allow" }, length:{ is: 10 } 
    validates :email, uniqueness: true 
    validates :designation, inclusion: { in: %w(Prof. Ass.Prof.), message: " can't be %{value}." }
    validates :designation, exclusion: { in: %w(HOD Sr.Prof.), message: "%{value} is not good choice." }
    # validate :check_email
    # private
    #     def check_email
    #         if email.match(/[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/)
               
    #         else     
    #             errors.add(:base, "Email is not valid.") 
    #         end            
    #     end
    
end     