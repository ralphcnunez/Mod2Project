class SessionsController < ApplicationController
   skip_before_action :authorized, except: :destroy

  def index
    if session[:user_id]
    @user = User.find(session[:user_id])
    @avatars = @user.avatars
    else
    @avatars = Avatar.all # or force a login
    end
  end

  def new
  end

  def create
     # params {username: 'me', password: '1234'}
     # find user by the username found in params from the login form
     @user = User.find_by({ username: params[:username] })
     # attempt to authenticate the user by username
     if !!@user && @user.authenticate(params[:password])
       flash[:notice] = "Successfully logged in #{@user.username}!"
       # store the logged in user somewhere
       session[:user_id] = @user.id
       redirect_to profile_path
     else
       flash[:notice] = "Invalid username or password"
       redirect_to login_path
     end
  end

   def destroy
     session.delete(:user_id)
     redirect_to login_path
   end








  # def new
  # end
  # def create
  # # no strong params cause there is no mass assignment
  # @user = User.find_by(username: params[:username])
  # if @user && @user.authenticate(params[:password])
  #   redirect_to @user
  # else
  #   redirect_to login_path
  # end
end
