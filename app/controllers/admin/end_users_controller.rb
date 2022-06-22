class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!, except: [:top]

  def index
    @end_users = EndUser.page(params[:page])
  end

  def show
    @end_user = EndUser.find(params[:id])
    @post_images = @end_user.post_images
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to admin_end_user_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:profile_image, :name, :introduction, :is_active)
  end
end