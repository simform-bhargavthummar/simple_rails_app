class Business::CustomerRoute < ApplicationRecord
  validates :name, :contact, :email, presence: true
end
