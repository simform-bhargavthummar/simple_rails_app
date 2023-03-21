class Business::CustomerRoutesController < ApplicationController
  def index
    @customers = Business::CustomerRoute.all
  end

  def new
    @customers = Business::CustomerRoute.new
  end

  def create
    @customers = Business::CustomerRoute.new(customer_param)
    if @customers.save
      redirect_to business_customer_routes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @customers = Business::CustomerRoute.find(params[:id])
  end

  def update

    @customers = 
      Business::CustomerRoute
        .find(params[:id])
        .update(customer_param)
    if @customers
      redirect_to business_customer_routes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def preview
    @customers = Business::CustomerRoute.select( :id, :name, :email )
  end

  def delete_customer
    @customers = Business::CustomerRoute.find(params[:id])
    @customers.destroy
    redirect_to business_customer_routes_path
  end

  def search
    
    if params[:name].present? 
      @customers = Business::CustomerRoute
        .where("name LIKE ?", "%#{params[:name]}%") 
    else 
      @customers = Business::CustomerRoute.all 
    end  
    
  end

  def check_product

  end

  private
    def customer_param
      params.require(:business_customer_route)
        .permit( 
          :name, 
          :contact, 
          :email)
    end
end
