class Consumer::RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:create, :update, :destroy]
  before_action :ensure_matching_user_and_set_record, except: [:create]
  def create
    @record = current_user.records.new(record_params)
    if @record.save
      @current_tab = "index_tab"
      redirect_to root_path(current_tab: "index_tab"), notice: I18n.t("consumer.records.create.notice")
    else
      @records = current_user.records.page(params[:page]).per(6)
      @preference_data = current_user.get_coffee_preference_data_array if @records.present?
      @coffees = Kaminari.paginate_array(current_user.get_matching_coffee_posts).page(params[:coffee_posts_page]).per(6)
      @current_tab = "new_record_tab"
      flash.now[:alert] = I18n.t("consumer.records.create.alert")
      render "consumer/homes/top"
    end
  end

  def show
    @record_data = @record.get_record_data
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to user_record_path(current_user, @record.id), notice: I18n.t("consumer.records.update.notice")
    else
      flash.now[:alert] = I18n.t("consumer.records.update.alert")
      render :edit
    end
  end

  def destroy
    @record.destroy
    redirect_to root_path(current_tab: "index_tab"), notice: I18n.t("consumer.records.destroy.notice")
  end

  private

  def record_params
    params.require(:record).permit(:coffee_name, :shop_name, :scene, :brewing, :sweetness,
                                   :acidity, :bitterness, :strength, :aftertaste, :impression, :rate, :record_image)
  end

  def ensure_matching_user_and_set_record
    @record = Record.find(params[:id])
    if current_user != @record.user
      redirect_to root_path, alert: I18n.t("consumer.reject_unmatch_user")
    end
  end
end
