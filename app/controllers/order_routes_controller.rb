class OrderRoutesController < ApplicationController
  before_action :set_product_object
  skip_before_action :set_product_object, only: [:edit, :update, :delete]
  def index
    @orders = OrderRoute.all
  end

  def new
    @orders = @product.order_routes.new
  end

  def create
    price = ProductRoute.find(params[:product_route_id]).price
    @orders = 
      @product
        .order_routes
        .new(
          quantity: order_param[:quantity],
          total: price*order_param[:quantity].to_i,
          product_route_id: order_param[:product_route_id]
        )  
    if @orders.save
      redirect_to product_routes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = ProductRoute.find(params[:product_route_id])
    @orders = @product.order_routes.find(params[:id])
  end 

  def update
    
    price = ProductRoute.find(params[:product_route_id]).price
    @orders = 
      OrderRoute
      .find(params[:id])
      .update( 
        quantity: order_param[:quantity],
        total: price*order_param[:quantity].to_i,
        product_route_id: params[:product_route_id]
        ) 
    if @orders
      redirect_to product_route_path(params[:product_route_id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @orders = OrderRoute.find(params[:id])
    @orders.destroy
    redirect_to product_route_path(params[:product_route_id])
  end

  private
    def order_param
      params
        .require(:order_route)
          .permit(:quantity, 
            :total, 
            :product_route_id)
    end

    def set_product_object
      @product = ProductRoute.find(params[:product_route_id])
    end
end
