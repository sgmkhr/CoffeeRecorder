class Seller::MakersController < ApplicationController
  before_action :authenticate_maker!
  before_action :ensure_guest_maker
  before_action :ensure_matching_maker_and_set_maker, except: [:edit]
  def edit
    @maker = current_maker
  end

  def update
    if @maker.update(maker_params)
      redirect_to seller_shops_path, notice: I18n.t("seller.makers.update.notice")
    else
      flash.now[:alert] = I18n.t("seller.makers.update.alert")
      render :edit
    end
  end

  def destroy
    @maker.destroy
    redirect_to new_maker_registration_path, notice: I18n.t("seller.makers.destroy.notice")
  end

  private

  def maker_params
    params.require(:maker).permit(:email, :company_name)
  end
  
  def ensure_matching_maker_and_set_maker
    @maker = Maker.find(params[:id])
    unless current_maker == @maker
      redirect_to seller_shops_path, alert: I18n.t("seller.reject_unmatch_maker")
    end
  end
end
