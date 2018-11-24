class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_event_details, only: [:new, :create]

  def index
    @events = current_user.events
    @owned_events = current_user.owned_events
  end

  def show
    current_user.events.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.assign_attributes(owner_id: current_user, image_url: @image)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :image_url)
  end

  def fetch_event_details
    @image = NasaService.new.get_image_url
    @users = User.all
  end
end
