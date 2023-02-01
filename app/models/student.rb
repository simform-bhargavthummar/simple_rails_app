class Student < ApplicationRecord
    validates :first_name, :last_name, :department, presence: true 
    validates :dob, presence:true, comparison: { less_than: Date.today }  
    validates :department, inclusion: { in: %w(IT CE), message: " can't be %{value}." }
    validates :terms_con, acceptance: { message: 'You cannot proceed without accepting Terms of Usage' }
end
