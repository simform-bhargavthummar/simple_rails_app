class AddReferenceProductToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_layouts, :product_layout, foreign_key: true
  end
end
