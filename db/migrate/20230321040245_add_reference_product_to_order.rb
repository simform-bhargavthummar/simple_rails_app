class AddReferenceProductToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_routes, :product_route, foreign_key: true
  end
end
