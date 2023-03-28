class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
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
    find_employee
  end

  def update
    find_employee
    if @employee.update(employee_param)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    find_employee
    @employee.destroy
    redirect_to root_path
  end

  def find_email
    @check_email = Employee.find_by_email(params[:email])
    if @check_email.present?
      flash[:success] = "Email is present."
    else
      flash[:alert] = "Email is not present"
    end
    redirect_to employees_path
  end

  def update_order
    top_ten_employee = Employee.limit(10)
    top_ten_employee.find_in_batches do |employee|
      employee.each do |employee_record|
        employee_record.update(no_of_order: employee_record.no_of_order + 1)
      end
    end
    redirect_to employees_path
  end

  def change_order
    top_ten_employee = Employee.limit(10)
    top_ten_employee.find_in_batches do |employee|
      employee.each do |employee_record|
        employee_record.update(no_of_order: employee_record.no_of_order - 1)
      end
    end
    redirect_to employees_path
  end

  def other_operations
    employees = Employee.all
    @que = []
    @que[0] = employees.where("age>20 AND age<40")
    @que[1] = employees.where("full_time_available = ?", "Yes")
    @que[2] = employees.where("no_of_order = ? AND age>25", 5)
    @que[3] = employees.where("created_at<?",Date.today)
    @que[4] = employees.where("no_of_order = ? OR age>25", 5)
    @que[5] = employees.order("age DESC")
    @que[6] = employees.order("no_of_order ASC")
    @que[7] = employees.where("salary > ?", 45000 )
    @que[8] = employees.select("first_name,sum(no_of_order) as order").group("first_name").having("sum(no_of_order)>5")
    @que[9] = employees.select(:id,:first_name,:last_name,:age).where("id>4 AND age>20").unscope(:where).reverse_order
    @que[10] = employees.select(:id,:first_name,:last_name,:age).where("id>4 AND age>20").order(:first_name).only(:where)
    @que[11] = employees.select(:first_name,:salary,:no_of_order).where("id>4").reselect(:id,:first_name,:age)
    @que[12] = employees.select(:id,:first_name,:last_name,:age).order(:first_name).reorder(:last_name)
  end

  private
    def employee_param
      params.require(:employee).permit(:first_name, :last_name, :email, :age, :no_of_order, :full_time_available, :salary)    
    end

    def find_employee
      @employee = Employee.find(params[:id])
    end
end
