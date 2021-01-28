class AttendancesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    attendance = Attendance.new(event_id: event.id, user_id: params[:user_id])

    if attendance.save
      attendance.invited!
      flash[:notice] = 'Invitation sent!'
      redirect_to users_path(event_id: event.id)
    else
      flash[:alert] = 'Ooops! Something went wrong...'
      redirect_to event_path(event)
    end
  end

  def destroy
    event = Event.find(params[:event_id])
    invite = Attendance.find(params[:id])
    if current_user == event.creator
      attendance.destroy
      flash[:notice] = 'The invitation is cancelled!'
    else
      attendance.status = 'invited'
      attendance.save
      flash[:notice] = "You have dropped the invite for the #{event.name}!"
    end

    redirect_to users_path(event_id: event.id, id: invite.id)
  end

  def update
    @event = Event.find(params[:event_id])
    @attendance = Attendance.find_by(event_id: params[:event_id], user_id: current_user.id)
    if @attendance.invited?
      @attendance.accepted!
      flash[:notice] = "Thank you for signing up for the '#{@event.name}'!"
    else
      flash[:alert] = 'Your name is not on the invitation list'
    end
    redirect_to event_path(@event)
  end
end
