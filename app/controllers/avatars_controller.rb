class AvatarsController < ApplicationController


  def index
    @user = User.find(params[:user_id])
    @avatars = @user.avatars
    end

  def show
    @avatar = Avatar.find(params[:id])
  end


  def edit
    @avatar = Avatar.find(params[:id])
  end

    def new
    # byebug
    # @user = User.find(params[:user_id])
    @avatar = Avatar.new
    end
  # @user = User.find(params[:id])
  # @avatar = @user.avatars.new(avatar_params)

  def create
     @user = User.find(params[:user_id])
     @avatar = Avatar.create(avatar_params)
     byebug
     # @user.avatars.new(avatar_params)
     if @avatar
       @avatar.save
       @user.avatars << @avatar
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
     @avatar = Avatar.find(params[:id])
     @like = @avatar.likes + 1
     @avatar.update(likes: @like)
     redirect_to user_avatar_path(@avatar.user, @avatar)
   end

   def method_name

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
