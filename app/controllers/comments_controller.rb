class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', {content: @comment, user: current_user, date: @comment.created_at.strftime('%Y/%m/%d %H:%M:%S')}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id:current_user.id,item_id:params[:item_id])
  end
  
end
