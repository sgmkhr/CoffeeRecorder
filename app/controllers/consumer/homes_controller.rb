class Consumer::HomesController < ApplicationController
  before_action :authenticate_user!
  def top
    @record = Record.new
    @records = current_user.records.page(params[:page])
    
    @current_tab = params[:current_tab]
    @current_tab == "main_tab" unless @current_tab.present?
  end
  
end
