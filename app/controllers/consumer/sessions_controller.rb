# frozen_string_literal: true

class Consumer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

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
  
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to coffee_posts_path, notice: I18n.t("consumer.guest_login.notice")
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
