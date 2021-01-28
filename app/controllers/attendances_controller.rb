class AttendancesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    invite = Invite.new(event_id: event.id, user_id: params[:user_id])

    if invite.save
      invite.invited!
      flash[:notice] = 'Invitation sent!'
      redirect_to users_path(event_id: event.id)
    else
      flash[:alert] = 'Ooops! Something went wrong...'
      redirect_to event_path(event)
    end
  end

  def destroy
    event = Event.find(params[:event_id])
    invite = Invite.find(params[:id])
    if current_user == event.creator
      invite.destroy
      flash[:notice] = 'The invitation is cancelled!'
    else
      invite.status = 'invited'
      invite.save
      flash[:notice] = "You have dropped the invite for the #{event.name}!"
    end

    redirect_to users_path(event_id: event.id, id: invite.id)
  end

  def update
    @event = Event.find(params[:event_id])
    @invite = Invite.find_by(event_id: params[:event_id], user_id: current_user.id)
    if @invite.invited?
      @invite.accepted!
      flash[:notice] = "Thank you for signing up for the '#{@event.name}'!"
    else
      flash[:alert] = 'Your name is not on the invitation list'
    end
    redirect_to event_path(@event)
  end
end
