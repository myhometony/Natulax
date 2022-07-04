class Public::PostImagesController < ApplicationController
  before_action :guest?, only:[:new]#ゲストユーザの利用制限、application_controllerに記載

  def index#投稿一覧と検索結果を一体化してあります。
    @search = PostImage.ransack(params[:q])#キー(:q)を使ってテーブルから情報を取得
    @results = @search.result.page(params[:page]).per(6).order(created_at: :desc)#orderで順番入れかえ
    #.resultで検索結果を取得
  end

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.end_user_id = current_end_user.id
    if @post_image.save
      categories = Vision.get_image_data(@post_image.image)
      categories.each do |category|
        @post_image.categories.create(name: category)
      end
      flash[:notice] = "投稿できました。"
      redirect_to public_end_user_path(current_end_user.id)
    else
      flash[:alert] = "投稿画像が選択されていません。"
      redirect_to request.referer
    end
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
    flash[:notice] = "更新できました。"
    redirect_to public_post_image_path
  end

  def destroy
    @post_image = PostImage.find(params[:id]).destroy
    redirect_to public_end_user_path(current_end_user.id)
    flash[:notice] = "投稿を削除しました。"
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :end_user_id, :title, :caption)
  end

end
