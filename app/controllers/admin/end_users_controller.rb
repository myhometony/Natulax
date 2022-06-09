class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
  end

  private

  def end_uer(params)
    params.require(end_user).permit(:profiel_image, :name, :introduction, :is_active)
  end
end
