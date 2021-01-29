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
  end

  def create
    @event = Event.new(event_params)
    @created_event = @event.current_user.build

    if @created_event.save
      redirect_to root_path,
                  notice: 'Event created succussfully!'
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
    params.require(:event).permit(:name, :Description)
  end
end
