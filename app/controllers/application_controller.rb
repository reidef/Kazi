class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    current_user
  end

  def login_required
    unless logged_in?
      redirect_to root_url, :alert => "You must be logged in to access that page."
    end
  end
  
  helper_method :current_user
end
