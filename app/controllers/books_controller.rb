class BooksController < ApplicationController

  def index
    @book = Book.all
  end

  def new
    @book = Book.new
    @auth_name = Author.all.map{ |a| [a.id] }
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to :action => 'index' 
    else
      render :new, status: :unprocessable_entity
    end
  end

   #For update the book
   def edit
    @book = Book.find(params[:id]) 
    @auth_name = Author.all.map{ |a| [a.id] }
  end

  def update
    @book = Book.find(params[:id]) 
    if @book.update(book_params)
     redirect_to :action => 'index'
    else
      render :edit, status: :unprocessable_entity
    end
  end

   #For delete the book
   def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :action => 'index'
  end 

  private
  def book_params
    params.require(:book).permit(:name, :price, :author_id)
  end
end
