class Shop::YearEndGiftsController < ApplicationController
  def index

    @year_end_gift = YearEndGift.new
    @shop_total_target_number = 0
    @shop_tptal_target_amount = 0
    @shop_total_number = 0
    @shop_total_amount = 0

    @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
    @all_year_end_gifts = YearEndGift.all
    @year_end_gifts = @all_year_end_gifts.where(year: @current_year)
    @year_end_gifts = @year_end_gifts.order(number: :asc) if params[:sort_amount] == "number_asc"
    @year_end_gifts = @year_end_gifts.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
    @year_end_gifts = @year_end_gifts.order(number: :desc) if params[:sort_amount] == "number_desc"
    @year_end_gifts = @year_end_gifts.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
    @year_end_gifts = @year_end_gifts.page(params[:page])
  end

  def create
    @year_end_gift = YearEndGift.new(year_end_gift_params)
    @year_end_gift.shop_id = current_shop.id
    if @year_end_gift.save
      redirect_to year_end_gifts_path, notice: "投稿に成功しました"
    else

      @shop_total_target_number = 0
      @shop_tptal_target_amount = 0
      @shop_total_number = 0
      @shop_total_amount = 0

      @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
      @all_year_end_gifts = YearEndGift.all
      @year_end_gifts = @all_year_end_gifts.where(year: @current_year)
      @year_end_gifts = @year_end_gifts.order(number: :asc) if params[:sort_amount] == "number_asc"
      @year_end_gifts = @year_end_gifts.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
      @year_end_gifts = @year_end_gifts.order(number: :desc) if params[:sort_amount] == "number_desc"
      @year_end_gifts = @year_end_gifts.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
      @year_end_gifts = @year_end_gifts.page(params[:page])
      render :index
    end
  end

  def update
    @year_end_gift = YearEndGift.find(params[:id])
    if @year_end_gift.update(year_end_gift_params)
      redirect_to year_end_gifts_path, notice: "投稿を更新しました"
    else
      @shop_total_target_number = 0
      @shop_tptal_target_amount = 0
      @shop_total_number = 0
      @shop_total_amount = 0

      @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
      @all_year_end_gifts = YearEndGift.all
      @year_end_gifts = @all_year_end_gifts.where(year: @current_year)
      @year_end_gifts = @year_end_gifts.order(number: :asc) if params[:sort_amount] == "number_asc"
      @year_end_gifts = @year_end_gifts.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
      @year_end_gifts = @year_end_gifts.order(number: :desc) if params[:sort_amount] == "number_desc"
      @year_end_gifts = @year_end_gifts.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
      @year_end_gifts = @year_end_gifts.page(params[:page])
      render :index
    end
  end

  def destroy
    @year_end_gift = YearEndGift.find(params[:id])
    @year_end_gift.destroy
    redirect_to year_end_gifts_path, notice: "投稿を削除しました"
  end

  private
    def year_end_gift_params
      params.require(:year_end_gift).permit(:year, :target_number, :target_amount, :total_amount, :number, :shop_id)
    end
end
