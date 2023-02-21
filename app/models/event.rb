class Event < ApplicationRecord
    #belongs_to :user
    has_many :users, through: :enrols
    has_many :enrols
    
end
