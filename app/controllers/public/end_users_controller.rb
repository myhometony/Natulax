class Public::EndUsersController < ApplicationController
  before_action :ensure_guest_end_user, only:[:edit]

  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
    @post_images = @end_user.post_images
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to public_end_user_path
  end

  def unsubscribe
    @end_user = current_end_user
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:profile_image, :name, :email, :introduction, :is_active)
  end

  def ensure_guest_end_user
    @end_user = EndUser.find(params[:id])
    if @end_user.name == "guestuser"
      redirect_to public_end_user_path(current_end_user), notice:"ゲストユーザはプロフィール編集画面へ遷移できません。"
    end
  end

end
