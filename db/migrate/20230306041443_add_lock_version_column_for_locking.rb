class AddLockVersionColumnForLocking < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :lock_version, :integer, default: 0, null: false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
