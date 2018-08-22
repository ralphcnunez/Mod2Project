class AvatarsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @avatars = Avatar.all
    @popular = Avatar.most_liked.first
    end

  def show
    @avatar = Avatar.find(params[:id])
    @comment = Comment.new
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
    @avatar.update(comment_params)
    if @avatar.update(comment_params)
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

    def comment_params
      params.require(:avatar).permit(comments_attributes:[:content, :user_id, :avatar_id, :_destroy])
    end


   def avatar_params
     params.require(:avatar).permit(:name, :likes, :costume_id, :user_id, :character_id, comments_attributes:[:id, :content])
   end
end
