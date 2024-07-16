class Seller::InformationPostsController < ApplicationController
  before_action :authenticate_maker!
  before_action :ensure_guest_maker, only[:create, :update, :destroy]
  before_action :ensure_correct_maker_and_set_shop
  def new
    @information = InformationPost.new
  end
  
  def create
    @information = @shop.information_posts.new(information_post_params)
    if @information.save
      redirect_to seller_shop_information_post_path(@shop.id, @information.id), notice: I18n.t("seller.information_posts.create.notice")
    else
      flash.now[:alert] = I18n.t("seller.information_posts.create.alert")
      render :new
    end
  end

  def show
    @information = InformationPost.find(params[:id])
  end

  def edit
    @information = InformationPost.find(params[:id])
  end
  
  def update
    @information = InformationPost.find(params[:id])
    if @information.update(information_post_params)
      redirect_to seller_shop_information_post_path(@shop.id, @information.id), notice: I18n.t("seller.information_posts.update.notice")
    else
      flash.now[:alert] = I18n.t("seller.information_posts.update.alert")
      render :edit
    end
  end
  
  def destroy
    InformationPost.find(params[:id]).destroy
    redirect_to seller_shop_path(@shop.id), notice: I18n.t("seller.information_posts.destroy.notice") 
  end
  
  private
  
  def information_post_params
    params.require(:information_post).permit(:title, :body, :information_image)
  end
  
  def ensure_correct_maker_and_set_shop
    @shop = Shop.find(params[:shop_id])
    unless current_maker.shop_ids.includes?(@shop.id)
      redirect_to seller_shops_path, alert: I18n.t("seller.information_posts.reject.alert")
    end
  end
end
