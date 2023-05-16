class AddReferenceUserToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :post_user, foreign_key: true
  end
end
