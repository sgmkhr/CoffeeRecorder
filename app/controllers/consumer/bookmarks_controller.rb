class Consumer::BookmarksController < ApplicationController
  before_action :authenticate_user!
  def create
    @shop = Shop.find(params[:shop_id])
    @coffee_post = CoffeePost.find(params[:coffee_post_id])
    @bookmark = current_user.bookmarks.create(coffee_post_id: @coffee_post.id)
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @coffee_post = CoffeePost.find(params[:coffee_post_id])
    current_user.bookmarks.find_by(coffee_post_id: @coffee_post.id).destroy
  end

  def index
    @coffee_posts = current_user.bookmarked_posts.page(params[:page]).per(12)
  end
end
