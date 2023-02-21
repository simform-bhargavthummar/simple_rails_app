class UsersController < ApplicationController
  def index
    if session[:user_id]==nil
      redirect_to sign_in_path
    else
      @u = User.find session[:user_id]
      x = Event.all
      @event = x.order("event_date DESC")

    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      redirect_to sign_in_path
    else
      flash[:alert] = "Invalid details..."
      render :new
    end
  end

  def show 

    @y = User.find session[:user_id]
     @user_enrol = @y.events


  end



  private
    def user_param
      params.require(:user).permit(:email, :password)
    end
end
