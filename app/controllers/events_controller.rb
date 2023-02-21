class EventsController < ApplicationController
  def index
   
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_param)
    if @event.save
      redirect_to user_event_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def event_param
    params.require(:event).permit(:name, :description, :event_date, :user_id) 
  end
end
