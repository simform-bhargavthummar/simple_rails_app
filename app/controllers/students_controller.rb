class StudentsController < ApplicationController
  def index
    @student = Student.all
  end

  def call_dept
    @std_department = Student.distinct(:department).pluck(:department)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_param)
   
    if @student.save
      redirect_to root_path
    end
  end

  def edit
    @student = Student.find(params[:id])
    call_dept
  end

  def update
    @student = Student.where(id: params[:id]).update(student_param)
    redirect_to root_path
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to root_path
  end

  private
    def student_param
      params.require(:student).permit(:first_name, :last_name, :dob, :department)
    end
end
