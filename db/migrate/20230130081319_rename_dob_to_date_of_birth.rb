class RenameDobToDateOfBirth < ActiveRecord::Migration[7.0]
  def up
    rename_column :authors, :dob, :date_of_birth
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
  def down
    rename_column :authors, :date_of_birth, :dob
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
  
end
