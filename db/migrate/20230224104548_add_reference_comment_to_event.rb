class AddReferenceCommentToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :event, foreign_key: true
  end
end
