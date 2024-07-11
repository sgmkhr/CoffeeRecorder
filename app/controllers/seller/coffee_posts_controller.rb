class Seller::CoffeePostsController < ApplicationController
  before_action :authenticate_maker!
  before_action :ensure_correct_maker_and_set_shop
  def new
    @coffee = CoffeePost.new
  end
  
  def create
    @coffee = @shop.coffee_posts.new(coffee_post_params)
    if @coffee.save
      redirect_to seller_shop_coffee_post_path(@shop.id, @coffee.id), notice: I18n.t("seller.coffee_posts.create.notice")
    else
      flash.now[:alert] = I18n.t("seller.coffee_posts.create.alert")
      render :new
    end
  end

  def show
    @coffee = CoffeePost.find(params[:id])
  end

  def edit
    @coffee = CoffeePost.find(params[:id])
  end
  
  def update
    @coffee = CoffeePost.find(params[:id])
    if @coffee.update(coffee_post_params)
      redirect_to seller_shop_coffee_post_path(@shop.id, @coffee.id), notice: I18n.t("seller.coffee_posts.update.notice")
    else
      flash.now[:alert] = I18n.t("seller.coffee_posts.update.alert")
      render :edit
    end
  end
  
  def destroy
    CoffeePost.find(params[:id]).destroy
    redirect_to seller_shop_path(@shop.id), notice: I18n.t("seller.coffee_posts.destroy.notice")
  end
  
  private
  
  def coffee_post_params
    params.require(:coffee_post).permit(:name, :introduction, :online_sale, :brewing, :roasting, :grind_size,
                                        :sweetness, :acidity, :bitterness, :strength, :aftertaste, :supplement, :coffee_image)
  end
  
  def ensure_correct_maker_and_set_shop
    @shop = Shop.find(params[:shop_id])
    unless current_maker.shop_ids.includes?(@shop.id)
      redirect_to seller_shops_path, alert: I18n.t("seller.coffee_posts.reject.alert")
    end
  end
end
