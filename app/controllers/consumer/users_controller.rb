class Consumer::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user
  before_action :ensure_matching_user_and_set_user, except: [:edit]
  def edit
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: I18n.t("consumer.users.update.notice")
    else
      flash.now[:alert] = I18n.t("consumer.users.update.alert")
      render edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_registration_path, notice: I18n.t("consumer.users.destroy.notice")
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end

  def ensure_matching_user_and_set_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path, alert: I18n.t("consumer.reject_unmatch_user")
    end
  end
end
