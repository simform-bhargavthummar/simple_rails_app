class CreateAddressForms < ActiveRecord::Migration[7.0]
  def change
    create_table :address_forms do |t|
      t.string :house_name
      t.string :street_name
      t.string :road

      t.timestamps
    end
  end
end
