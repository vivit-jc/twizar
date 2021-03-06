class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private
  def current_user
    if(session[:user_id])
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_user = nil
    end
  end
end