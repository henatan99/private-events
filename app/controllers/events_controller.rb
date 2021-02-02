class EventsController < ApplicationController
  before_action :require_login, only: %i[new edit update destroy invitation cancel_invitation]
  before_action :set_event, only: %i[show edit update destroy]
  def index
    @events = Event.order(created_at: :DESC)
    @prev_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @edit = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_path,
                  notice: 'Event created succussfully!'
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to root_path, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = current_user.created_events.find params[:id]
    @event.destroy
    redirect_to root_path, notice: 'Event successfully deleted.'
  end

  def invitation
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      redirect_to @event, alert: 'You are already on the list'
    else
      @event.attendees << current_user
      redirect_to @event, notice: 'You successfully registered for this event!'
    end
  end

  def cancel_invitation
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to @event, alert: 'You are no longer attending this event'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :Description, :date)
  end
end
