class ProductRoutesController < ApplicationController
  def index
    @products = ProductRoute.all
  end

  def new
    @products = ProductRoute.new
  end

  def create
    @products = ProductRoute.new(qp_param)
    if @products.save
      redirect_to product_routes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @products = ProductRoute.find(params[:id])
  end

  def update
    @products = ProductRoute.find(params[:id])
    if @products.update(qp_param)
      redirect_to product_routes_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @products = ProductRoute.find(params[:id])
    @products.destroy
    redirect_to product_routes_path
  end

  def show
    @orders = ProductRoute.find(params[:id]).order_routes
    @product = ProductRoute.find(params[:id])
  end

  private
    def qp_param
      params.require(:product_route).permit(:title, :price, :company_name)
    end
end
