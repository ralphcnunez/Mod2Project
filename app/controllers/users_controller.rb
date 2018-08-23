class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :index, :create, :show]
# before_action :find_user, only: [:show, :edit, :update, :destroy]
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def edit

    end

    def new
      @user = User.new
    end

    def create
      @user = User.create(password_params)
       if @user.valid?
         @user.save
         session[:user_id] = @user.id
        redirect_to new_user_avatar_path(@user)
      else
        render :new
       end
     end

    def update
      if @user.update(user_params)
      redirect_to @user
      else
         render :edit
       end
    end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def password_params
    params.require(:user).permit(:email, :password)

  end
    def user_params
      params.require(:user).permit(:name, :bio, :location, :age)
    end

end
