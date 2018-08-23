class CommentsController < ApplicationController

  def index
    @comment = Comment.all
  end

def new
@comment = Comment.new(comment_params)
end

def create
  @comment = Comment.new(comment_params)
  @comment.avatar_id = params[:avatar_id]
  @comment.user_id = 1
   if @comment.valid?
     @comment.save
     redirect_to user_avatar_path(@comment.user_id, @comment.avatar_id)
   else
     render :new
   end
end

private

def avatar_params
 params.require(:avatar).permit(:name, :likes, :costume_id, :user_id, :character_id, comments_attributes:[:id, :content])
end
def comment_params
  params.require(:comment).permit(:content)
end

end
