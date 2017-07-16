class EventsController < ApplicationController
  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      flash[:danger] = "Unable to Create Event"
      render 'new'
    end
  end

  def index
    @events = Event.all.paginate(page: params[:page], per_page: 5)
  end

  def show
    @event = Event.find(params[:id])
  end


private

  def event_params
    params.require(:event).permit(:title, :description, :starts_at)
  end 
end
