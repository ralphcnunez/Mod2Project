class AvatarsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @avatars = @user.avatars
    end

  def show
    @avatar = Avatar.find(params[:id])
    @comment = Comment.new(avatar_id: @avatar.id, user_id: @avatar.user.id)
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
