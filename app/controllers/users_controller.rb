class UsersController < ApplicationController
  def index
    if session[:user_id] == nil
      redirect_to sign_in_path
    else
      @u = User.find session[:user_id]
       @x = Category.pluck(:category_name, :id)
      if session[:c_id].nil?
        @event = Event.all.order("event_date DESC")
      else
        @event = Event.where(category_id: session[:c_id]).order("event_date DESC")
        session[:c_id] = nil
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(email: user_params[:email], password: user_params[:password])
    @user.create_address(address: user_params[:address])
    
    if @user
      redirect_to sign_in_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def event_filter
    session[:c_id] = params[:category_id]  
    redirect_to users_path
  end

  def show 
    @y = User.find session[:user_id]
     @user_enrol = @y.events
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :address)
    end
end
