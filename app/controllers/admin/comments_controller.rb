class Admin::CommentsController < ApplicationController

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_post_image_path(params[:post_image_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end
