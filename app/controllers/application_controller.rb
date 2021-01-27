class ApplicationController < ActionController::Base
  private

  def require_login
    return if current_user.nil?

    flash[:error] = 'Please log In!'
    redirect_to new_session_path
  end

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
