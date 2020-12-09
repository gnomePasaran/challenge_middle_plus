class EventsController < ApplicationController
  before_action :find_current_user_event, only: %i[edit update]

  def index
    @events = Event.includes(:user).chronologically.page(page)
  end

  def show
    @event = Event.find(params[:id])

    # TODO make it in a single PORO
    render layout: 'evrone' if @event.event_type_id.in?(EventType.evrone_special.pluck(:id))
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params.merge(user_id: current_user.id))

    if @event.valid?
      redirect_to events_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :new
    end
  end

  private

  def find_current_user_event
    @event ||= Event.find_by!(id: params[:id], user_id: current_user.id)
  end

  def page
    params[:page] || 0
  end

  def event_params
    params.require(:event).permit(:title, :event_type_id, :date, :start_at, :finish_at, :description)
  end
end
