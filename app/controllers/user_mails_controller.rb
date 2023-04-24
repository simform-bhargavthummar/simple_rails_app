class UserMailsController < ApplicationController
  before_action :find_user, only: [ :edit, :update, :destroy]
  def index
    @users = UserMail.all
  end

  def new
    @user = UserMail.new
  end

  def create
    @user = UserMail.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new, status: 422
    end
  end

  def edit
    @user.image.file.nil? ? @image_name = 'Choose an image' : @image_name = @user.image.file.original_filename
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: 422
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end
  
  private
    def user_params
      params.require(:user_mail).permit( :name, :email, :image )
    end
     
    def find_user
      @user = UserMail.find(params[:id])
    end 
end
