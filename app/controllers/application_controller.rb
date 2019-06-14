class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_user

  def authenticate_user!
    unless current_user
      redirect_to root_path
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
