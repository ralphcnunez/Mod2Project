class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      flash[:notice] = "Sucessfully logged in"
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Invalid Username or Password"
      redirect_to login_path
    end
  end
end
