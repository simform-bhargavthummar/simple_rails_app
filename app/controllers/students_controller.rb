class StudentsController < ApplicationController
  def index
    @student = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_param)

    if @student.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    #@student = Student.where(id: params[:id]).update(student_param)
    @student = Student.find(params[:id])

    if @student.update(student_update)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to root_path
  end

  private
    def student_param
      params.require(:student).permit(:first_name, :last_name, :dob, :department, :terms_con)
    end

    def student_update
      params.require(:student).permit(:first_name, :last_name, :dob, :department)
    end
end
