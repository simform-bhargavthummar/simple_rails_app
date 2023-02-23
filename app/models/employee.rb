class Employee < ApplicationRecord
  validates :first_name, :last_name, :email, :age, :no_of_order, :full_time_available, :salary, presence: true
  validates :salary, :age, numericality: { only_integer: true, message: 'only number will allow.' }
end
