class QueryProductsController < ApplicationController
  def index
    @query_product = QueryProduct.all
  end

  def all_products
    @query_product = QueryProduct.unscoped
  end

  def new
    @query_product = QueryProduct.new
    @status = QueryProduct.statuses.keys 
    #if i write keys then only i can access it and it will process by default and convert string to int.
  end

  def create
    @query_product = QueryProduct.new(qp_param)
    if @query_product.save
      redirect_to  query_products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    get_query_product
    @status = QueryProduct.statuses.keys 
  end

  def update
    get_query_product
    if @query_product.update(qp_param)
      redirect_to query_products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    get_query_product
    @query_product.destroy
    redirect_to query_products_path
  end

  def show
    @order_count = 
      QueryProduct
        .joins(:orders)
        .where(id: params[:id])
        .group(:title).count
  end

  private
    def qp_param
      params.require(:query_product).permit(:title, :description, :price, :capacity, :is_active, :status)
    end

    def get_query_product
      @query_product = QueryProduct.find(params[:id])
    end
end                                