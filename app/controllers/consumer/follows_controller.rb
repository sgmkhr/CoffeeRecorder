class Consumer::FollowsController < ApplicationController
  before_action :authenticate_user!
  def create
    @shop = Shop.find(params[:shop_id])
    current_user.follows.create(shop_id: @shop.id)
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    current_user.follows.find_by(shop_id: @shop.id).destroy
  end

  def index
    @shops = current_user.followed_shops.page(params[:page]).per(12)
  end
end
