class SessionsController < ApplicationController
  def new; end

  def create
    if user = User.find_by_name(params[:name])
      session[:user_id] = user.id
      redirect_to posts_path, notice: 'You successfully signed in!'
    else
      render :new, notice: 'Invalid name!'
    end
  end

  def destroy
    @current_user = session[:current_user_id] = nil
    redirect_to root_path, notice: 'You successfully logged Out!'
  end
end
