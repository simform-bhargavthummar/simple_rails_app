class ChangeDataTypeOfPhone < ActiveRecord::Migration[7.0]
  def up
    change_column :faculties, :phone_number, :bigint
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
