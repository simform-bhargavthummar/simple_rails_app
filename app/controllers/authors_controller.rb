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
      redirect_to :action => 'index'
    else
      render :new, status: :unprocessable_entity
    end
  end
 #For update the author
  def edit
    @author = Author.find(params[:id]) 
  end

  def update
    @author = Author.find(params[:id]) 

    if @author.update(author_params)
      redirect_to :action => 'index'
    else  
      render :edit, status: :unprocessable_entity
    end
  end

  #For delete the author
  def destroy
    @author = Author.find(params[:id])
    # x = Book.where(author_id: :id)
    # x.delete_all
    @author.destroy
      
    redirect_to :action => 'index'
  end 

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name, :date_of_birth, :email)
    end

end
