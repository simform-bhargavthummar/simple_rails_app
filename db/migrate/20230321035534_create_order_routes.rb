class CreateOrderRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :order_routes do |t|
      t.integer :quantity
      t.integer :total

      t.timestamps
    end
  end
end
