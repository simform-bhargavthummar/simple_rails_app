class OrdersController < ApplicationController

  def index
    @status = Order.statuses.keys
    status_data = Order.where(status: params[:status])
    # if params[:title].blank? && status_data.nil?
    #   @order = Order.all
    # else
    #   demo = QueryProduct.find_by_title(params[:title])
    #   if demo == nil
    #     @order = Order.all
    #   else
    #     @order = demo.orders.where(status: params[:status])
    #   end
    @orders = Order.includes(:customer, :query_product).all
    #end
    
    # if status_data==0
    #   @order = Order.find_by_status(0)
    # else
    #   @order = Order.find_by_status(1)
    # end
  end

  def new
    @order = Order.new
  find_for_select
  end

  def create
  add_order
    if @order.save
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end 
  end

  def edit
    #binding.pry
    @order = Order.find(params[:id])
    find_for_select
  end

  def update
    price = QueryProduct.find(order_params[:query_product_id]).price
    @order =
      Order.find(params[:id])
        .update(
          quantity: order_params[:quantity],
          total_price: price*order_params[:quantity].to_i,
          query_product_id: order_params[:query_product_id],
          status: order_params[:status],
          customer_id: order_params[:customer_id]
        )
    if @order
      redirect_to orders_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path 
  end

  def find_product; end

  private
    def add_order 
      price = QueryProduct.find(order_params[:query_product_id]).price
      @order = 
        Order.new(
          quantity: order_params[:quantity],
          total_price: price*order_params[:quantity].to_i,
          query_product_id: order_params[:query_product_id],
          status: order_params[:status],
          customer_id: order_params[:customer_id]
        )  
    end

    def find_for_select
      @status = Order.statuses.keys
      @product = QueryProduct.distinct.pluck(:title, :id)
      @customer = Customer.distinct.pluck(:first_name, :id)
    end

    def order_params
      params.require(:order).permit(:quantity, :total_price, :query_product_id, :status, :customer_id)
    end
end
