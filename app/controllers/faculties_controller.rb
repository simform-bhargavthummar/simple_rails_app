class FacultiesController < ApplicationController
  def index
    @faculty = Faculty.all
  end

  def new
    @faculty = Faculty.new
  end
  
  def create
    @faculty = Faculty.new(faculty_param)

    if @faculty.save
      redirect_to :action => 'index'
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def update
    @faculty = Faculty.find(params[:id])
    
    if @faculty.update(faculty_param)
      redirect_to :action => 'index'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy
    redirect_to :action => 'index'
  end

  private
    def faculty_param
      params.require(:faculty).permit(:first_name, :last_name, :dob, :phone_number, :email, :designation)
    end

end
