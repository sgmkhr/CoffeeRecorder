class Seller::MakersController < ApplicationController
  before_action :authenticate_maker!
  before_action :ensure_guest_maker
  def edit
    @maker = current_maker
  end

  def update
    @maker = Maker.find(params[:id])
    if @maker.update(maker_params)
      redirect_to seller_shops_path, notice: I18n.t("seller.makers.update.notice")
    else
      flash.now[:alert] = I18n.t("seller.makers.update.alert")
      render :edit
    end
  end

  def destroy
    Maker.find(params[:id]).destroy
    redirect_to new_maker_registration_path, notice: I18n.t("seller.makers.destroy.notice")
  end

  private

  def maker_params
    params.require(:maker).permit(:email, :company_name)
  end
end
