class PostUsersController < ApplicationController
  def new
    @user = PostUser.new
  end

  def create
    @user = PostUser.create(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new, status: 422
    end
  end

  def login
    @user = PostUser.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "Login sucessfully..."
    else
      flash[:notice] = "Invalid login...."
      redirect_to root_path
    end
  end

  def check_login; end
  
  def logout
    session.destroy
    flash[:notice] = "You logout... :)"
    redirect_to root_path
  end

  private
    def user_params
      params.require(:post_user).permit( :name, :email, :password )
    end 
end
