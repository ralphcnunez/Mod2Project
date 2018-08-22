class AvatarsController < ApplicationController


  # def index
  #   @user = User.find(params[:user_id])
  #   @avatars = @user.avatars
  #   @popular = Avatar.most_liked.first
  #   end

  def index
    @user = User.find(params[:user_id])
    @avatars = Avatar.all
    @popular = Avatar.most_liked.first
    end

  def show
    @avatar = Avatar.find(params[:id])
  end


  def edit
    @avatar = Avatar.find(params[:id])
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
       @user.avatars << @avatar
      redirect_to user_avatar_path(@avatar.user, @avatar)
    else
      render :new
     end
   end

  # def most_liked
  #     counter = 0
  #     answer = ""
  #     Avatar.all.each do |avatar|
  #       if avatar.likes > counter
  #         counter = avatar
  #      end
  #    end
  #    answer
  # end

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
     # def avatar_params
     #   params.require(:avatar).permit(:name, :likes, :costume_id, :user_id, :character_id)
     # end

end
