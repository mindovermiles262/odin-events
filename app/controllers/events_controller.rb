class EventsController < ApplicationController
  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    @event.host_id = @current_user.id
    if @event.save
      flash[:success] = "Event \"#{@event.title}\" Created"
      redirect_to @event
    else
      flash[:danger] = "Unable to Create Event"
      render 'new'
    end
  end

  def index
    @upcoming_events = Event.upcoming.paginate(page: params[:page], per_page: 5)
    @past_events = Event.past.paginate(page: params[:page], per_page: 5)
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.users
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event Deleted"
    redirect_to events_path
  end


private

  def event_params
    params.require(:event).permit(:title, :description, :starts_at, :host_id)
  end 
end
