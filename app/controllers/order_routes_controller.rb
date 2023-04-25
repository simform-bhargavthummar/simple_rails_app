class OrderRoutesController < ApplicationController
  before_action :set_product_object
  skip_before_action :set_product_object, only: [:edit, :update, :delete]
  def index
    @orders = OrderRoute.all
  end

  def new
    @order = @product.order_routes.new
  end

  def create
    get_price
    @order = 
      @product
        .order_routes
        .new(
          quantity: order_param[:quantity],
          total: @price*order_param[:quantity].to_i,
          product_route_id: order_param[:product_route_id]
        )  
    if @order.save
      redirect_to product_routes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_product_object
    get_order
  end 

  def update
    get_price
    get_order
    if @order.update( 
      quantity: order_param[:quantity],
      total: @price*order_param[:quantity].to_i,
      product_route_id: params[:product_route_id]
      ) 
      redirect_to product_route_path(params[:product_route_id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    get_order
    @order.destroy
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

    def get_price
      @price = ProductRoute.find(params[:product_route_id]).price
    end

    def get_order
      @order = OrderRoute.find(params[:id])
    end
end
