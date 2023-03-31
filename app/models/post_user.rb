class PostUser < ApplicationRecord
  has_secure_password
  validates :name, :email, :password_digest, presence: true
end
