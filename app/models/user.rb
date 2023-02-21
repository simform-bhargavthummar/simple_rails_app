class User < ApplicationRecord
    has_secure_password
   # has_many :events
    has_many :enrols
    has_many :events, through: :enrols
    has_one :address, as: :addressable
  
end