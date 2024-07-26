class Consumer::HomesController < ApplicationController
  before_action :authenticate_user!
  def top
    @record = Record.new
    @records = current_user.records.page(params[:page])
    
    @preference_data = current_user.get_coffee_preference_data_array
    
    @coffees = Kaminari.paginate_array(current_user.get_matching_coffee_posts).page(params[:coffee_posts_page])
    
    @current_tab = params[:current_tab]
    @current_tab == "main_tab" unless @current_tab.present?
  end
  
end
