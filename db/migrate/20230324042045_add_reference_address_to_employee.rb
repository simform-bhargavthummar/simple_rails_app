class AddReferenceAddressToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_reference :address_forms, :employee_form, foreign_key: true
  end
end
