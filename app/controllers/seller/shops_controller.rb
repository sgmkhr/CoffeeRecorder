class Seller::ShopsController < ApplicationController
  before_action :authenticate_maker!
  before_action :ensure_guest_maker, only: [:create, :update, :destroy]
  def index
    @shop = Shop.new
    @shops = current_maker.shops.page(params[:page]).per(20)
  end
  
  def create
    @shop = current_maker.shops.new(shop_params)
    if @shop.save
      redirect_to seller_shops_path, notice: I18n.t("seller.shops.create.notice")
    else
      flash.now[:alert] = I18n.t("seller.shops.create.alert")
      render :index
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @coffees = @shop.coffee_posts.page(params[:coffee_page])
    @informations = @shop.information_posts.page(params[:information_page])
  end

  def edit
    @shop = Shop.find(params[:id])
  end
  
  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to seller_shops_path, notice: I18n.t("seller.shops.update.notice")
    else
      flash.now[:alert] = I18n.t("seller.shops.update.alert")
      render :edit
    end
  end
  
  def destroy
    Shop.find(params[:id]).destroy
    redirect_to seller_shops_path, notice: I18n.t("seller.shops.destroy.notice")
  end
  
  private
  
  def shop_params
    params.require(:shop).permit(:name, :address, :introduction, :website)
  end
end
