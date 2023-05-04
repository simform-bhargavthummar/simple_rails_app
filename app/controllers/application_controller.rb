class ApplicationController < ActionController::Base
  private
  def require_login
    unless current_user
      flash[:error] = 'You must be logged in to access this page.'
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= UserCont.find(session[:user_id]) if session[:user_id]
  end
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:user_layouts) do |user_params|
      user_params.permit( :email, :role )
    end
  end
end
