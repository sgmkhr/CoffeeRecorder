class Consumer::RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:create, :update, :destroy]
  def create
    @record = current_user.records.new(record_params)
    if @record.save
      @current_tab = "index_tab"
      redirect_to root_path(current_tab: "index_tab"), notice: I18n.t("consumer.records.create.notice")
    else
      @records = current_user.records.page(params[:page])
      @current_tab = "new_record_tab"
      flash.now[:alert] = I18n.t("consumer.records.create.alert")
      render "consumer/homes/top"
    end
  end
  
  def show
    @record = Record.find(params[:id])
    @record_data = @record.get_record_data
  end

  def edit
    @record = Record.find(params[:id])
  end
  
  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to user_record_path(current_user, @record.id), notice: I18n.t("consumer.records.update.notice")
    else
      flash.now[:alert] = I18n.t("consumer.records.update.alert")
      render :edit
    end
  end
  
  def destroy
    Record.find(params[:id]).destroy
    redirect_to root_path(current_tab: "index_tab"), notice: I18n.t("consumer.records.destroy.notice")
  end
  
  private
  
  def record_params
    params.require(:record).permit(:coffee_name, :shop_name, :scene, :brewing, :sweetness,
                                   :acidity, :bitterness, :strength, :aftertaste, :impression, :rate, :record_image)
  end
end
