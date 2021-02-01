class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_name(params[:name])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in succussfully!'
    else
      render 'new', alert: 'The name is invalid'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out succussfully!'
  end
end
