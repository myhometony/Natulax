# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_inactive_end_user, only: [:create]

  def after_sign_in_path_for(resource)
    public_end_user_path(current_end_user.id)
  end

  def guest_sign_in
    end_user = EndUser.guest
    sign_in end_user
    redirect_to public_end_user_path(current_end_user.id), notice:"ナチュラ君としてログインしました。"
  end

  def reject_inactive_end_user
    @end_user = EndUser.find_by(email: params[:end_user][:email])
    if @end_user
      if @end_user.valid_password?(params[:end_user][:password]) && !@end_user.is_active
        flash[:alert] = "こちらのメールアドレスは退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。"
        redirect_to new_end_user_session_path
      end
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
