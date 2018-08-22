class ApplicationController < ActionController::Base
  before_action :authorize 
  def current_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
    end
  end

  def logged_in?
    !!current_user
  end

  def authorize
    redirect_to login_path unless logged_in?
  end

end
