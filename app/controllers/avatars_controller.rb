class AvatarsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :edit, :update, :destroy, :new]


  def index
    @user = User.find(params[:user_id])
    @avatars = Avatar.all
    @popular = Avatar.most_liked.first
    end

  def show
    @avatar = Avatar.find(params[:id])
    if @avatar.id == @avatar.user.avatars.first.id
      flash[:notice] = "You are at the first avatar"
    elsif @avatar.id == @avatar.user.avatars.last.id
      flash[:notice] = "You are at the last avatar"
    end
  end

  def new
  @avatar = Avatar.new
  end


def create
   @user = User.find(params[:user_id])
   @avatar = Avatar.new(avatar_params)
   @avatar.user_id = @user.id
   if @avatar
     @avatar.save
    redirect_to user_avatar_path(@avatar.user, @avatar)
  else
    render :new
   end
 end


  def edit
    @avatar = Avatar.find(params[:id])

  end

  def update
    @avatar = Avatar.find(params[:id])
    @avatar.update(avatar_params)
    if @avatar.update(avatar_params)
      redirect_to user_avatar_path(@avatar.user, @avatar)
    else
      render :edit
    end
  end

   def likes
     @avatar = Avatar.find(params[:id])
     @like = @avatar.likes + 1
     @avatar.update(likes: @like)
     redirect_to user_avatar_path(@avatar.user, @avatar)
   end

   def home
     @avatars = Avatar.all
   end

   def destroy
     @avatars = Avatar.find(params[:id]).destroy
     redirect_to user_avatars_path
   end


   private

  def most_liked
      count = 0
      answer = []
      Avatar.all.each do |avatar|
        if avatar.likes > count
          answer << avatar.name
       end
     end
     answer.first
  end


   def find_user
     @user = User.find(params[:user_id])
   end

   def set_avatar
      @avatar = Avatar.find(params[:id])
    end

   def avatar_params
     params.require(:avatar).permit(:name, :likes, :costume_id, :user_id, :character_id)
   end
end
