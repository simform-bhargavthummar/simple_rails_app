class Event < ApplicationRecord
    belongs_to :user
    has_many :users, through: :enrols
    has_many :enrols
    belongs_to :category
    has_many :comments, as: :commentable 
    
end
