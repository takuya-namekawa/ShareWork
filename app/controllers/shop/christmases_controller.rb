class Shop::ChristmasesController < ApplicationController
  before_action :user_authenticate

  def index

    @christmas = Christmas.new
    @shop_total_amount = 0
    @shop_tptal_booking_target = 0
    @shop_store_sales_amount = 0

    @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
    @all_christmases = Christmas.all
    @christmases = @all_christmases.where(year: @current_year)
    @christmases = @christmases.order(booking_amount: :asc) if params[:sort_amount] == "booking_amount_asc"
    @christmases = @christmases.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
    @christmases = @christmases.order(booking_amount: :desc) if params[:sort_amount] == "booking_amount_desc"
    @christmases = @christmases.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
    @christmases = @christmases.page(params[:page])

  end

  def create
    @christmas = Christmas.new(christmas_params)
    @christmas.shop_id = current_shop.id
    if @christmas.save
      redirect_to christmases_path, notice: "投稿に成功しました"
    else
      @shop_total_amount = 0
      @shop_tptal_booking_target = 0
      @shop_store_sales_amount = 0

      @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
      @all_christmases = Christmas.all
      @christmases = @all_christmases.where(year: @current_year)
      @christmases = @christmases.order(booking_amount: :asc) if params[:sort_amount] == "booking_amount_asc"
      @christmases = @christmases.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
      @christmases = @christmases.order(booking_amount: :desc) if params[:sort_amount] == "booking_amount_desc"
      @christmases = @christmases.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
      @christmases = @christmases.page(params[:page])
      render :index
    end
  end

  def update
    @christmas = Christmas.find(params[:id])
    if @christmas.update(christmas_params)
      redirect_to christmases_path, notice: "投稿を更新しました"
    else
      @shop_total_amount = 0
      @shop_tptal_booking_target = 0
      @shop_store_sales_amount = 0

      @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
      @all_christmases = Christmas.all
      @christmases = @all_christmases.where(year: @current_year)
      @christmases = @christmases.order(booking_amount: :asc) if params[:sort_amount] == "booking_amount_asc"
      @christmases = @christmases.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
      @christmases = @christmases.order(booking_amount: :desc) if params[:sort_amount] == "booking_amount_desc"
      @christmases = @christmases.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
      @christmases = @christmases.page(params[:page])
      render :index
    end
  end

  def destroy
    @christmas = Christmas.find(params[:id])
    @christmas.destroy
    redirect_to christmases_path, notice: "投稿を削除しました"
  end


  def edit
    @christmas = Christmas.find(params[:id])
  end

  private

  def user_authenticate
    if shop_signed_in? || management_signed_in?
    else
      redirect_to root_path
    end
  end


  def christmas_params
    params.require(:christmas).permit(:year, :booking_target,:booking_amount, :target_amount,  :store_sales_amount, :total_amount, :shop_id, :ff_amount)
  end
end
