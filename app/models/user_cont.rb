class UserCont < ApplicationRecord
  has_secure_password
  validates :name, :email, :password, presence: true
end
