class AddressForm < ApplicationRecord
  belongs_to :employee_form
  validates :street_name, :house_name, :road, presence: true
end
