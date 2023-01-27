class UpDownAndReversible < ActiveRecord::Migration[7.0]
  
  def up 
    add_column :authors, :publication, :string, default: "Mr.K Publication"
  end

  def down
    remove_column :authors, :publication
  end
end
