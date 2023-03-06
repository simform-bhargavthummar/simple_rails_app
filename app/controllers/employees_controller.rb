class EmployeesController < ApplicationController
  def index
    @employee = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.find_or_initialize_by(employee_param)  
    #we can use find_or_create_by also but it will direct save the record in our table.

    if @employee.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_param)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to root_path
  end

  def find_email
    @check_email = Employee.find_by_email(params[:email])
    
    if @check_email
      flash[:alert] = "Email is present."
      redirect_to employees_path
    else
      flash[:alert] = "Email is not present"
      redirect_to employees_path
    end
  end

  def update_order
    x = Employee.limit(10)
    x.find_in_batches do |s|
      s.each do |e|
        e.update(no_of_order: e.no_of_order + 1)
      end
    end
    redirect_to employees_path
  end

  def change_order
    x = Employee.limit(10)
    x.find_in_batches do |s|
      s.each do |e|
        e.update(no_of_order: e.no_of_order - 1)
      end
    end
    redirect_to employees_path
  end

  def other_operations
    employee = Employee.all
    @que = []
    @que[0] = employee.where("age>20 AND age<40")
    @que[1] = employee.where("full_time_available = ?", "Yes")
    @que[2] = employee.where("no_of_order = ? AND age>25", 5)
    @que[3] = employee.where("created_at<?",Date.today)
    @que[4] = employee.where("no_of_order = ? OR age>25", 5)
    @que[5] = employee.order("age DESC")
    @que[6] = employee.order("no_of_order ASC")
    @que[7] = employee.where("salary > ?", 45000 )
    @que[8] = employee.select("first_name,sum(no_of_order) as order").group("first_name").having("sum(no_of_order)>5")
    @que[9] = employee.select(:id,:first_name,:last_name,:age).where("id>4 AND age>20").unscope(:where).reverse_order
    @que[10] = employee.select(:id,:first_name,:last_name,:age).where("id>4 AND age>20").order(:first_name).only(:where)
    @que[11] = employee.select(:first_name,:salary,:no_of_order).where("id>4").reselect(:id,:first_name,:age)
    @que[12] = employee.select(:id,:first_name,:last_name,:age).order(:first_name).reorder(:last_name)
  end

  private
    def employee_param
      params.require(:employee).permit(:first_name, :last_name, :email, :age, :no_of_order, :full_time_available, :salary)    
    end
end
