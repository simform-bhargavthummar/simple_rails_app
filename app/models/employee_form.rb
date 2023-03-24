class EmployeeForm < ApplicationRecord
  has_one :address_form, dependent: :destroy
  accepts_nested_attributes_for :address_form
  HOBBIES = %i[Fighting Gaming Cricket Traveling]
  validates :employee_name, 
    :email, 
    :password, 
    :gender,
    :mobile_number,
    :birth_date,
    :hobbies,
    :document,
    presence: true 
  validates :mobile_number, numericality: { only_integer: true}
  
end
