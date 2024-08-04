class Consumer::InformationPostsController < ApplicationController
  before_action :authenticate_user!
  def show
    @information = InformationPost.find(params[:id])
    unless @information.views.find_by(user_id: current_user.id)
      @information.views.create(user_id: current_user.id)
    end
  end
end
