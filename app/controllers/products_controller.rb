class ProductsController < ApplicationController
  def index
    @product = Product.pluck(:id,:name)
   
  end

  def show
    @product = Product.find(params[:id])
    
  end
end
