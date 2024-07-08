class Seller::MakersController < ApplicationController
  def edit
    @maker = current_maker
  end
  
  def update
    @maker = Maker.find(params[:id])
    if @maker.update(maker_params)
      redirect_to seller_edit_maker_path(@maker.id), notice: I18n.t("seller.makers.update.notice") #後ほどルート先修正
    else
      flash.now[:alert] = I18n.t("seller.makers.update.alert")
      render seller_edit_maker_path
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
