class CreateUserMails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_mails do |t|
      t.string :name
      t.string :email
      t.text :image

      t.timestamps
    end
  end
end
