class ProductRoutesController < ApplicationController
  def index
    @products = ProductRoute.all
  end

  def new
    @product = ProductRoute.new
  end

  def create
    @product = ProductRoute.new(qp_param)
    if @product.save
      redirect_to product_routes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    find_product
  end

  def update
    find_product
    if @product.update(qp_param)
      redirect_to product_routes_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    find_product
    @product.destroy
    redirect_to product_routes_path
  end

  def show
    @orders = ProductRoute.find(params[:id]).order_routes
    find_product
  end

  private
    def qp_param
      params.require(:product_route).permit(:title, :price, :company_name)
    end
     
    def find_product
      @product = ProductRoute.find(params[:id])
    end

end
