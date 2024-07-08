class Consumer::UsersController < ApplicationController
  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: I18n.t("consumer.users.update.notice")
    else
      flash.now[:alert] = I18n.t("consumer.users.update.alert")
      render edit_user_path
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to new_user_registration_path, notice: I18n.t("consumer.users.destroy.notice")
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email)
  end
end
