class AddReferenceUserAndPostToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :post_likes, :post_user, foreign_key: true
    add_reference :post_likes, :post, foreign_key: true
  end
end
