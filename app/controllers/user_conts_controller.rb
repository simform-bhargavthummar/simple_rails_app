class UserContsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin123"
  def new
    @user = UserCont.new
  end

  def create
    @user = UserCont.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity  
    end
  end
  
  def check_login; end

  def login 
    @user = UserCont.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      cookies[:user_name] = @user.name  
      redirect_to cars_path, notice: "Login sucessfully..."
    else
      flash[:notice] = "Invalid login...."
      redirect_to cars_path
    end
  end
  
  def logout
    session[:user_id] = nil
    cookies.delete(:user_name)
    flash[:notice] = "You logout... :)"
    redirect_to login_path
  end

  private
    def user_params
      params.require(:user_cont).permit(:name, :email, :password)
    end 
end
