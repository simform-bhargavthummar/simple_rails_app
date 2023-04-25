class Business::CustomerRoute < ApplicationRecord
  validates :name, :contact, :email, presence: true
  validates :contact, length: { is: 10 }, numericality: true
  validates :email, uniqueness: true
end
