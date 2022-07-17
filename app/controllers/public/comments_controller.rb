class Public::CommentsController < ApplicationController

  def create
    @post_image = PostImage.find(params[:post_image_id])
    @comment = current_end_user.comments.new(comment_params)
    @comment.post_image_id = @post_image.id
    if @comment.save
    else
      flash[:alert] = "コメントが入力されていません。"
      redirect_to request.referer
    end
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    Comment.find(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end
