class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    root_path
  end

  def guest?#ゲストユーザの利用制限
    if current_end_user.name == "ゲストユーザ"
      redirect_to public_post_images_path, notice:"ゲストユーザではご利用いただけません。"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
