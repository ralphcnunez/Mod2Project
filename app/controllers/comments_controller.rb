class CommentsController < ApplicationController

  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new(comment_params)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.avatar_id = params[:avatar_id]
     if @comment.valid?
       @comment.save
       redirect_to user_avatar_path(@comment.user_id, @comment.avatar_id)
     else
       render :new
     end
   end

   def destroy
     @comment = Comment.find(params[:id]).destroy
     redirect_to user_avatar_path(@comment.user, @comment.avatar)
   end



  private


  def comment_params
    params.require(:comment).permit(:content)
  end

end
