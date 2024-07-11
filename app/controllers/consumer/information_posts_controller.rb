class Consumer::InformationPostsController < ApplicationController
  before_action :authenticate_user!
  def show
    @information = InformationPost.find(params[:id])
  end
end
