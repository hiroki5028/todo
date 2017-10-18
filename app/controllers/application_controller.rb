class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception
  # include SessionsHelper

  helper_method :current_user, :logged_in?, :require_login

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
      !current_user.nil?
  end
  def require_login
    unless logged_in?
      redirect_to controller: :users, action: :new
    end
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end
