class Consumer::CoffeePostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @coffees = CoffeePost.page(params[:page])
  end

  def show
    @coffee = CoffeePost.find(params[:id])
  end
end
