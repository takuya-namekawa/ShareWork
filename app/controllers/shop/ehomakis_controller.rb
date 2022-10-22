class Shop::EhomakisController < ApplicationController
  before_action :user_authenticate

  def index

    @ehomaki = Ehomaki.new
    @shop_total_amount = 0
    @shop_tptal_booking_target = 0
    @shop_store_sales_amount = 0

    @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
    @all_ehomakis = Ehomaki.all
    @ehomakis = @all_ehomakis.where(year: @current_year)
    @ehomakis = @ehomakis.order(booking_amount: :asc) if params[:sort_amount] == "booking_amount_asc"
    @ehomakis = @ehomakis.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
    @ehomakis = @ehomakis.order(booking_amount: :desc) if params[:sort_amount] == "booking_amount_desc"
    @ehomakis = @ehomakis.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
    @ehomakis = @ehomakis.page(params[:page])
  end

  def create
    @ehomaki = Ehomaki.new(ehomaki_params)
    @ehomaki.shop_id = current_shop.id
    if @ehomaki.save
      redirect_to ehomakis_path, notice: "投稿に成功しました"
    else

      @shop_total_amount = 0
      @shop_tptal_booking_target = 0
      @shop_store_sales_amount = 0

      @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
      @all_ehomakis = Ehomaki.all
      @ehomakis = @all_ehomakis.where(year: @current_year)
      @ehomakis = @ehomakis.order(booking_amount: :asc) if params[:sort_amount] == "booking_amount_asc"
      @ehomakis = @ehomakis.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
      @ehomakis = @ehomakis.order(booking_amount: :desc) if params[:sort_amount] == "booking_amount_desc"
      @ehomakis = @ehomakis.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
      @ehomakis = @ehomakis.page(params[:page])
      render :index
    end
  end

  def update
    @ehomaki = Ehomaki.find(params[:id])
    if @ehomaki.update(ehomaki_params)
      redirect_to ehomakis_path, notice: "投稿を更新しました"
    else

      @shop_total_amount = 0
      @shop_tptal_booking_target = 0
      @shop_store_sales_amount = 0

      @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
      @all_ehomakis = Ehomaki.all
      @ehomakis = @all_ehomakis.where(year: @current_year)
      @ehomakis = @ehomakis.order(booking_amount: :asc) if params[:sort_amount] == "booking_amount_asc"
      @ehomakis = @ehomakis.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
      @ehomakis = @ehomakis.order(booking_amount: :desc) if params[:sort_amount] == "booking_amount_desc"
      @ehomakis = @ehomakis.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
      @ehomakis = @ehomakis.page(params[:page])
      render :index
    end
  end

  def destroy
    @ehomaki = Ehomaki.find(params[:id])
    @ehomaki.destroy
    redirect_to ehomakis_path, notice: "投稿を削除しました"
  end

  private

  def user_authenticate
    if shop_signed_in? || management_signed_in?
    else
      redirect_to root_path
    end
  end

  def ehomaki_params
    params.require(:ehomaki).permit(:year, :booking_target,:booking_amount, :target_amount,  :store_sales_amount, :total_amount, :shop_id)
  end
end
