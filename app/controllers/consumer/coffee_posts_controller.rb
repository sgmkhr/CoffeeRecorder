class Consumer::CoffeePostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @coffees = CoffeePost.page(params[:page])
  end

  def show
    @coffee = CoffeePost.find(params[:id])
    @coffee_data = @coffee.get_coffee_data
    unless @coffee.views.find_by(user_id: current_user.id)
      @coffee.views.create(user_id: current_user.id)
    end
  end
end
