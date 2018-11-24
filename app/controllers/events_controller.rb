class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_event_details, only: [:new, :create]

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
  end

  def create
    @event = current_user.owned_events.build(event_params.merge(image_url: @image))
    pry binding
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :date)
  end

  def fetch_event_details
    @image = NasaService.new.get_image_url
    @users = User.all
  end
end
