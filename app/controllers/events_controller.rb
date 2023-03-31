class EventsController < ApplicationController
  def index; end

  def new
    @event = Event.new
    @x = Category.pluck(:category_name, :id)
  end

  def create
    @event = Event.new(event_param)
    if @event.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end



  private
    def event_param
      params.require(:event).permit(:name, :description, :event_date, :category_id, :user_id)
    end
end
