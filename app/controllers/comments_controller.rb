class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comments_params)
    @nickname = current_user.nickname 
    if @comment.save
      # 引数は複数でも遅れるっぽい
      ActionCable.server.broadcast 'comment_channel', content: @comment, nickname: @nickname
    else
      @item = @comment.item
      @comments = @item.comments
      render "items/show"
    end

  end

  private

    def comments_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
    end
    

end
