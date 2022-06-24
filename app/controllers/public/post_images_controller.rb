class Public::PostImagesController < ApplicationController

  def index#投稿一覧と検索結果を一体化してあります。
    @search = PostImage.ransack(params[:q])#キー(:q)を使ってテーブルから情報を取得
    @results = @search.result.page(params[:page]).per(6)#.resultで検索結果を取得
  end

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.end_user_id = current_end_user.id
    @post_image.save!
    redirect_to public_post_images_path
  end

  def show
    @post_image = PostImage.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    @post_image.update(post_image_params)
    redirect_to public_post_image_path
  end

  def destroy
    @post_image = PostImage.find(params[:id]).destroy
    redirect_to public_post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :end_user_id, :category_id, :title, :caption)
  end

end
