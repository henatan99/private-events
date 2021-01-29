class EventsController < ApplicationController
  before_action :require_login, only: %i[new edit update destroy]

  # GET /events or /events.json
  def index
    @events = Event.order(created_at: :DESC)
  end

  # GET /events/1 or /events/1.json
  def show; end

  # GET /events/1/edit
  def edit; end
  # POST /events or /events.json

  def new
    @event = Event.new
    # @user = current_user.find_by_name(params[:name])
    # @created_event = @user.created_events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @created_event.save
      flash[:notice] = "Event '#{@event.name}' created succussfully!"
      redirect_to @created_event
    else
      render 'new'
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :date ,:description)
  end
end
