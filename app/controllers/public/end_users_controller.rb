class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!, except: [:top]
  before_action :guest?, only:[:edit]#ゲストユーザの利用制限、application_controllerに記載

  def index#一覧と検索結果を一体化してあります。
    @search = EndUser.ransack(params[:q])#キー(:q)を使ってテーブルから情報を取得
    @results = @search.result.page(params[:page]).order(created_at: :desc)#orderで順番入れかえ
    #検索結果を取得
  end

  def favorites
    @end_user = EndUser.find(params[:id])
    favorites= Favorite.where(end_user_id: @end_user.id).order(created_at: :desc).pluck(:post_image_id)#pluckでカラムの取得
    @favorite_posts = PostImage.find(favorites)
  end

  def show
    @end_user = EndUser.find(params[:id])
    @search = @end_user.post_images.ransack(params[:q])#キー(:q)を使ってテーブルから情報を取得
    @results = @search.result.page(params[:page]).per(6).order(created_at: :desc)#orderで順番入れかえ
    #.resultで検索結果を取得
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to public_end_user_path
      flash[:notice] = "プロフィールが更新されました。"
    else
      render "edit"
    end
  end

  def unsubscribe
    @end_user = current_end_user
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(is_active: false)
    reset_session
    redirect_to root_path
    flash[:notice] = "退会しました。"
  end

  private

  def end_user_params
    params.require(:end_user).permit(:profile_image, :name, :email, :introduction, :is_active)
  end

end
