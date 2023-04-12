class CreateUserConts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_conts do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
