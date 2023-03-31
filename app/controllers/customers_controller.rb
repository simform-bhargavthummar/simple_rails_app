class CustomersController < ApplicationController
  def index
    @customers =  Customer.all 
  end

  def root
    query
  end

  def query
    set_query
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_param)
    if @customer.save
      redirect_to customers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    find_customer
  end

  def update
    find_customer
    if @customer.update(customer_param)
      redirect_to customers_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    find_customer
    @customer.destroy
    redirect_to customers_path
  end

  private
    def customer_param
      params.require(:customer).permit(:first_name, :last_name, :email, :phone_number)
    end

    def find_customer
      @customer = Customer.find(params[:id])
    end

    def set_query
      @max_cancel_order = 
        Customer.
          joins(:orders)
            .group("customers.id")
            .order("count(orders.id) desc")
            .select("customers.first_name, count(customers.id) as most_cancel_order")
            .where("orders.status = 1")
            .first(5)
  
      @max_book_order = 
        Customer.
          joins(:orders)
            .group("customers.id")
            .order("count(orders.id) desc")
            .select("customers.first_name, count(customers.id) as most_book_order")
            .where("orders.status = 0")
            .first(5)

      @sum_quantity = 
        Customer.
          joins(:orders)
            .group("customers.first_name")
            .select("customers.first_name, sum(orders.quantity) as total_que")
            .order("sum(orders.quantity) desc").
            limit(3)


      @sum_price = 
      Customer.
        joins(:orders)
          .group("customers.first_name")
          .select("customers.first_name, sum(orders.total_price) as total")
          .order("sum(orders.total_price) desc").
          limit(3) 
    end
end
