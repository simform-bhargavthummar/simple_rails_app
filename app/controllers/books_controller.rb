class BooksController < ApplicationController

  def index
    @book = Book.all
  end

  def new
    @book = Book.new
    @auth_name = Book.all.map{ |a| [a.id] }
  end

  def create
    @book = Book.create(book_params)

    if @book.save
      redirect_to :action => 'index'
    end
  end

   #For update the book
   def edit
    @book = Book.find(params[:id]) 
    @auth_name = Book.all.map{ |a| [a.id] }
  end

  def update
    @book = Book.where(id: params[:id]).update(book_params)
    redirect_to :action => 'index'
  end

   #For delete the book
   def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :action => 'index'
  end 

  private
  def book_params
    params.require(:book).permit(:name, :price, :book_id)
  end
end
