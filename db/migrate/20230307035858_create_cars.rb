class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :color
      t.integer :price
      t.integer :average

      t.timestamps
    end
  end
end
