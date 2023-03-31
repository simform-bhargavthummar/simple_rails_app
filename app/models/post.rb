class Post < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  validates :title, :body, presence: true
end
