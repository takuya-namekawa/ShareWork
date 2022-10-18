class Shop::SummerGiftsController < ApplicationController
  def index

    @summer_gift = SummerGift.new
    @shop_total_target_number = 0
    @shop_tptal_target_amount = 0
    @shop_total_number = 0
    @shop_total_amount = 0

    @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
    @all_summer_gifts = SummerGift.all
    @summer_gifts = @all_summer_gifts.where(year: @current_year)
    @summer_gifts = @summer_gifts.order(number: :asc) if params[:sort_amount] == "number_asc"
    @summer_gifts = @summer_gifts.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
    @summer_gifts = @summer_gifts.order(number: :desc) if params[:sort_amount] == "number_desc"
    @summer_gifts = @summer_gifts.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
    @summer_gifts = @summer_gifts.page(params[:page])
  end

  def create
    @summer_gift = SummerGift.new(summer_gift_params)
    @summer_gift.shop_id = current_shop.id
    if @summer_gift.save
      redirect_to summer_gifts_path
    else
      @shop_total_target_number = 0
      @shop_tptal_target_amount = 0
      @shop_total_number = 0
      @shop_total_amount = 0

      @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
      @all_summer_gifts = SummerGift.all
      @summer_gifts = @all_summer_gifts.where(year: @current_year)
      @summer_gifts = @summer_gifts.order(number: :asc) if params[:sort_amount] == "number_asc"
      @summer_gifts = @summer_gifts.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
      @summer_gifts = @summer_gifts.order(number: :desc) if params[:sort_amount] == "number_desc"
      @summer_gifts = @summer_gifts.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
      @summer_gifts = @summer_gifts.page(params[:page])
      render :index
    end
  end

  def update
    @summer_gift = SummerGift.find(params[:id])
    if @summer_gift.update(summer_gift_params)
      redirect_to summer_gifts_path
    else
      @shop_total_target_number = 0
      @shop_tptal_target_amount = 0
      @shop_total_number = 0
      @shop_total_amount = 0

      @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
      @all_summer_gifts = SummerGift.all
      @summer_gifts = @all_summer_gifts.where(year: @current_year)
      @summer_gifts = @summer_gifts.order(number: :asc) if params[:sort_amount] == "number_asc"
      @summer_gifts = @summer_gifts.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
      @summer_gifts = @summer_gifts.order(number: :desc) if params[:sort_amount] == "number_desc"
      @summer_gifts = @summer_gifts.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
      @summer_gifts = @summer_gifts.page(params[:page])
      render :index
    end
  end

  def destroy
    @summer_gift = SummerGift.find(params[:id])
    @summer_gift.destroy
    redirect_to summer_gifts_path
  end

  private
    def summer_gift_params
      params.require(:summer_gift).permit(:year, :target_number, :target_amount, :total_amount, :number, :shop_id)
    end
end
