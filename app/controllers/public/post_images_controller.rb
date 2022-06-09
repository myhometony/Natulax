class Public::PostImagesController < ApplicationController
  def index
    @post_images = PostImage.all
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
    params.require(:post_image).permit(:image, :end_user_id, :title, :caption)
  end
end
