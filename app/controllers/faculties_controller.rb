class FacultiesController < ApplicationController
  def index
    @faculty = Faculty.all
  end

  def call_des
    @fac_des = Faculty.distinct(:designation).pluck(:designation)
  end

  def new
    @faculty = Faculty.new
    call_des
  end
  
  def create
    @faculty = Faculty.new(faculty_param)
    if @faculty.save
      redirect_to :action => 'index'
    end

  end

  def edit
    @faculty = Faculty.find(params[:id])
    call_des
  end

  def update
    @faculty = Faculty.where(id: params[:id]).update(faculty_param)
    redirect_to :action => 'index'
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy
    redirect_to :action => 'index'
  end

  def faculty_param
    params.require(:faculty).permit(:first_name, :last_name, :phone_number, :email, :dob, :designation)
  end
end
