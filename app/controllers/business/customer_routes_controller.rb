class Business::CustomerRoutesController < ApplicationController
  def index
    all_customer
  end

  def new
    @customer = Business::CustomerRoute.new
  end

  def create
    @customer = Business::CustomerRoute.new(customer_param)
    if @customer.save
      redirect_to business_customer_routes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    get_record
  end

  def update
    get_record
    if @customer.update(customer_param)
      redirect_to business_customer_routes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def preview
    @customers = Business::CustomerRoute.select( :id, :name, :email )
  end

  def delete_customer
    get_record
    @customer.destroy
    redirect_to business_customer_routes_path
  end

  def search
    if params[:name].present? 
      @customers = Business::CustomerRoute
        .where("name LIKE ?", "%#{params[:name]}%") 
    else 
      all_customer 
    end  
    
  end

  def check_product; end

  private
    def customer_param
      params.require(:business_customer_route)
        .permit( 
          :name, 
          :contact, 
          :email)
    end

    def get_record
      @customer = Business::CustomerRoute.find(params[:id])
    end

    def all_customer
      @customers = Business::CustomerRoute.all
    end
end
