class AddHobbiesToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employee_forms, :hobbies, :text, array: true, default: [] 
  end
end
