class CreateEmployeeForms < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_forms do |t|
      t.string :employee_name
      t.string :email
      t.string :password
      t.string :gender
      t.string :address
      t.string :mobile_number
      t.date :birth_date
      t.string :document

      t.timestamps
    end
  end
end
