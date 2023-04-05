class AddRefToEnrol < ActiveRecord::Migration[7.0]
  def change
    add_reference :enrols, :event, foreign_key: true
    add_reference :enrols, :user, foreign_key: true
    
  end
end
