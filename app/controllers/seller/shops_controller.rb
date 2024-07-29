class Seller::ShopsController < ApplicationController
  before_action :authenticate_maker!
  before_action :ensure_guest_maker, only: [:create, :update, :destroy]
  before_action :ensure_matching_maker_and_set_shop, except: [:index, :create]
  def index
    @shop = Shop.new
    @shops = current_maker.shops.page(params[:page]).per(20)
  end
  
  def create
    @shop = current_maker.shops.new(shop_params)
    if @shop.save
      redirect_to seller_shops_path, notice: I18n.t("seller.shops.create.notice")
    else
      @shops = current_maker.shops.page(params[:page]).per(20)
      flash.now[:alert] = I18n.t("seller.shops.create.alert")
      render :index
    end
  end

  def show
    @coffees = @shop.coffee_posts.page(params[:coffee_page])
    @informations = @shop.information_posts.page(params[:information_page])
  end

  def edit
  end
  
  def update
    if @shop.update(shop_params)
      redirect_to seller_shop_path(@shop.id), notice: I18n.t("seller.shops.update.notice")
    else
      flash.now[:alert] = I18n.t("seller.shops.update.alert")
      render :edit
    end
  end
  
  def destroy
    @shop.destroy
    redirect_to seller_shops_path, notice: I18n.t("seller.shops.destroy.notice")
  end
  
  private
  
  def shop_params
    params.require(:shop).permit(:name, :address, :introduction, :website)
  end
  
  def ensure_matching_maker_and_set_shop
    @shop = Shop.find(params[:id])
    if current_maker != @shop.maker
      redirect_to seller_shops_path, alert: I18n.t("seller.reject_unmatch_maker")
    end
  end
end
