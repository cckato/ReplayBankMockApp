class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to movie_path(comment_params[:movie_id])
    else
      redirect_to movie_path(comment_params[:movie_id]), notice: 'コメント投稿エラー'
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :movie_id)
  end
end
