class Admin::PostImagesController < ApplicationController

  def index#一覧と検索結果を一体化してあります。
    @search = PostImage.ransack(params[:q])#キー(:q)を使ってテーブルから情報を取得
    @results = @search.result(distinct: true).page(params[:page]).per(6).order(created_at: :desc)
    #resultで検索結果を取得 #distinctで結果の重複を避ける #orderで順番入れかえ
  end

  def show
    @post_image = PostImage.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    PostImage.find(params[:id]).destroy
    redirect_to admin_post_images_path
    flash[:notice] = "投稿を削除しました。"
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :end_user_id, :category_id, :title, :caption)
  end
end
