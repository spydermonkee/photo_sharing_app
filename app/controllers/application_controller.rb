class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to '/', alert: "You can't do this thing you wish to do...IMPOSTER!" if (current_user != User.find(params[:user_id]))
    # before_filter :authorize, only: [:edit, :update] --put in controllers
  end
end
