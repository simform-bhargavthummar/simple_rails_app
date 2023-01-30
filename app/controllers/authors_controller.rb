class AuthorsController < ApplicationController
  def index
    @author = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to index_path
    else
      render :new, status: :unprocessable_entity
    end
  end
 #For update the author
  def edit
    @author = Author.find(params[:id]) 
  end

  def update
    @author = Author.where(id: params[:id]).update(author_params)
    redirect_to root_path
  end

  #For delete the author
  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to root_path
  end 

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :dob, :email)
  end

end
