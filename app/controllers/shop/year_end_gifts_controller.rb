class Shop::YearEndGiftsController < ApplicationController
  def index
    @year_end_gifts = YearEndGift.all
    @year_end_gift = YearEndGift.new
  end

  def create
    @year_end_gift = YearEndGift.new(year_end_gift_params)
    @year_end_gift.shop_id = current_shop.id
    @year_end_gift.save
    redirect_to year_end_gifts_path
  end

  def update
    @year_end_gift = YearEndGift.find(params[:id])
    @year_end_gift.update(year_end_gift_params)
    redirect_to year_end_gifts_path
  end

  def destroy
    @year_end_gift = YearEndGift.find(params[:id])
    @year_end_gift.destroy
    redirect_to year_end_gifts_path
  end


  def edit
    @year_end_gift = YearEndGift.find(params[:id])
  end

  private
    def year_end_gift_params
      params.require(:year_end_gift).permit(:year, :target_number, :target_amount, :total_amount, :number, :shop_id)
    end
end
