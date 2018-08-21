class AvatarsController < ApplicationController

  def show
    @avatar = Avatar.find(params[:id])
  end

  def edit

  end

    def new
    # byebug
    # @user = User.find(params[:user_id])
    @avatar = Avatar.new
    end
  # @user = User.find(params[:id])
  # @avatar = @user.avatars.new(avatar_params)

  def create
     # @user = User.find(params[:user_id])
     @avatar = @user.avatars.new(avatar_params)
    # byebug
     if @avatar.valid?
       @avatar.save
      redirect_to user_avatar_path(@avatar.user, @avatar)
    else
      render :new
     end
   end
   def avatar_params
     params.require(:avatar).permit(:name, :likes, :costume_id, :user_id, :character_id)
   end

   def likes
     @user = User.find(params[:user_id])
     @avatar = @user.avatars.find(params[:id])
     @like = @avatar.likes + 1
     @avatar.update(likes: @like)
     redirect_to user_avatar_path(@avatar.user, @avatar)
   end


   private

   def find_user
     @user = User.find(params[:user_id])

   end
   def set_avatar
      @avatar = Avatar.find(params[:id])
    end
     # def avatar_params
     #   params.require(:avatar).permit(:name, :likes, :costume_id, :user_id, :character_id)
     # end

end
