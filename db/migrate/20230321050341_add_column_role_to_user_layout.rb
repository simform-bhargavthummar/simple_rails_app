class AddColumnRoleToUserLayout < ActiveRecord::Migration[7.0]
  def change
    add_column :user_layouts, :role, :integer
  end
end
