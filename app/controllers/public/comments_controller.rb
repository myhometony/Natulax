class Public::CommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_end_user.comments.new(comment_params)
    comment.post_image_id = post_image.id
    if comment.save
      flash[:notice] = "コメントを投稿しました。"
    else
      flash[:alert] = "コメントが入力されていません。"
    end
    redirect_to request.referer
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to request.referer
    flash[:notice] = "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end
