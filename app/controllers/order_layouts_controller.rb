class OrderLayoutsController < ApplicationController
  before_action :authenticate_user_layout!
  layout :orders_layout
  def index
    @orders = OrderLayout.all
  end

  private
  def orders_layout
    if current_user_layout.admin?
      'admin'  
    else
      'merchant'
    end
  end
end
