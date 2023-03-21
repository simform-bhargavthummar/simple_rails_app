class ProductLayoutsController < ApplicationController
  before_action :authenticate_user_layout!
  layout :products_layout

  def index
    @products = ProductLayout.all
  end

  def new
    @product = ProductLayout.new
  end

  def create
    @product = ProductLayout.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: 422
    end
  end

  def edit
    find_product
  end

  def update
    find_product
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit, status: 422
    end
  end

  def destroy
    find_product
    @product.destroy
    redirect_to root_path
  end

  private

  def products_layout
    if current_user_layout.admin?
      "admin"
    else
      "merchant"
    end
  end

  def product_params
    params.require(:product_layout)
      .permit(
        :name,
        :description,
        :price
      )
  end

  def find_product
    @product = ProductLayout.find(params[:id])
  end
end
