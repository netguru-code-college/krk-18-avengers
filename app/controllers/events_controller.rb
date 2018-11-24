class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = current_user.events
    @owned_events = current_user.owned_events
  end

  def show
    @event = current_user.events.find_by(id: params[:id])
    @event = current_user.owned_events.find_by(id: params[:id]) if @event.blank?
  end

  def new
    @event = Event.new
    @users = User.all.pluck(:nick, :id)
  end

  def create
    image_url = NasaService.new.get_image_url
    @event = current_user.owned_events.build(event_params.merge(image_url: image_url))
    if @event.save
      redirect_to event_path(@event)
    else
      @users = User.all
      render :new
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :date)
  end
end
