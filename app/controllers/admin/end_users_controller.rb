class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!, except: [:top]

  def index#一覧と検索結果を一体化してあります。
    @search = EndUser.ransack(params[:q])#キー(:q)を使ってテーブルから情報を取得
    @results = @search.result.page(params[:page]).order(created_at: :desc)#orderで順番入れかえ
    #検索結果を取得
  end

  def show
    @end_user = EndUser.find(params[:id])
    @search = @end_user.post_images.ransack(params[:q])#キー(:q)を使ってテーブルから情報を取得
    @results = @search.result.page(params[:page]).per(6).order(created_at: :desc)#orderで順番入れかえ
    #検索結果を取得
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    flash[:notice] = "ステータスが更新されました。"
    redirect_to request.referer
  end

  private

  def end_user_params
    params.require(:end_user).permit(:profile_image, :name, :introduction, :is_active)
  end
end