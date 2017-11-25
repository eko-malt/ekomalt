class SessionsController < ApplicationController
  skip_before_action :authorize

  def new; end

  def create
    @user = User.find_by(login: params[:user][:login])
    redirect_to(root_path) && return unless @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
