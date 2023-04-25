class CreateProductRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :product_routes do |t|
      t.string :title
      t.integer :price
      t.string :company_name

      t.timestamps
    end
  end
end
