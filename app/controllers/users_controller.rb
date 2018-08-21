class UsersController < ApplicationController
  #before_action :find_user, only: [:show, :new, :edit, :update, :destroy]

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
      @user = User.new(user_params)
       if @user.valid?
         @user.save
        redirect_to user_path(@user)
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
    def user_params
      params.require(:user).permit(:name, :bio, :location, :age)
    end

end
