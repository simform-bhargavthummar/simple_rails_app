class SessionsController < ApplicationController
  def index

  end

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id  
      redirect_to users_path, notice: "Login sucessfully..."
    else
      flash[:alert] = "Invalid login...."
      render :new
    end
  end


  def logout
    session[:user_id] = nil
    redirect_to sign_in_path
  end

end