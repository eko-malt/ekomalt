class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  protected

  def authorize
    redirect_to '/login' unless session[:user_id]
  end

  helper_method :current_user

  private

  def require_admin
    current_user.admin? ? return : redirect_to(root_url)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
