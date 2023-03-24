class EmployeeFormsController < ApplicationController
  before_action :all_employees, only: [ :index, :search ]
  before_action :find_employee, only: [ :edit, :update, :destroy ]
  def index ; end

  def new
    @employee = EmployeeForm.new
    @employee.build_address_form
  end

  def create
    @employee = EmployeeForm.new(employee_param)
    if @employee.save
      redirect_to root_path
    else
      render :new, status: 422
    end
  end

  def edit ; end

  def update
    if @employee.update(employee_param)
      redirect_to root_path
    else
      render :edit, status: 422
    end
  end

  def destroy
    @employee.destroy
    redirect_to root_path
  end

  def search
    if params[:employee_name].present? 
      @employees = EmployeeForm
        .where("employee_name LIKE ?", "%#{params[:employee_name]}%")
    end  
    @employees = @employees.order(:id)
  end

  private
    def find_employee
      @employee = EmployeeForm.find(params[:id])
    end

    def employee_param
      params.require(:employee_form).permit(
        :employee_name,
        :email,
        :password,
        :birth_date,
        :gender,
        :mobile_number,
        :document,
        address_form_attributes: [:house_name, :street_name, :road],
        hobbies: []
      )
    end

    def all_employees
      @employees = EmployeeForm.all
    end
end
