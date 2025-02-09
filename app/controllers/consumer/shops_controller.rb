class Consumer::ShopsController < ApplicationController
  before_action :authenticate_user!
  def index
    @keyword = params[:keyword]
    @shops = @keyword ? Shop.search_for(@keyword) : Shop.all
    @shops = @shops.page(params[:page])
  end

  def show
    @shop = Shop.find(params[:id])
    @coffees = @shop.coffee_posts.page(params[:coffee_page])
    @informations = @shop.information_posts.page(params[:information_page])
  end
end
