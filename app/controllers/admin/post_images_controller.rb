class Admin::PostImagesController < ApplicationController

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    @post_image.update(post_image_params)
    redirect_to admin_post_image_path
  end

  def destroy
    @post_image = PostImage.find(params[:id]).destroy
    redirect_to admin_post_images_path
  end

  def search_drink
    @results = @p.result
    #検索結果を取得
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :end_user_id, :title, :caption)
  end

  def create_searching_object
    @p = PostImage.ransack(params[:q])
    #キー(:q)を使ってテーブルから情報を取得
  end

end