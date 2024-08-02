class Consumer::HomesController < ApplicationController
  before_action :authenticate_user!
  def top
    @record = Record.new
    
    @sort = params[:sort]
    @records = current_user.records
    @records = @records.latest    if @sort == "latest"
    @records = @records.old       if @sort == "old"
    @records = @records.high_rate if @sort == "high_rate"
    @records = @records.low_rate  if @sort == "low_rate"
    @records = @records.page(params[:page]).per(6)
    
    @preference_data = current_user.get_coffee_preference_data_array if @records.present?
    
    @coffees = Kaminari.paginate_array(current_user.get_matching_coffee_posts).page(params[:coffee_posts_page]).per(6)
    
    @current_tab = params[:current_tab]
    @current_tab == "main_tab" unless @current_tab.present?
  end
  
end
