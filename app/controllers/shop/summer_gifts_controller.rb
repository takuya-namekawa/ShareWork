class Shop::SummerGiftsController < ApplicationController
  def index
    @summer_gifts = SummerGift.all
    @summer_gift = SummerGift.new
  end

  def create
    @summer_gift = SummerGift.new(summer_gift_params)
    @summer_gift.shop_id = current_shop.id
    @summer_gift.save
    redirect_to summer_gifts_path
  end

  def update
    @summer_gift = SummerGift.find(params[:id])
    @summer_gift.update(summer_gift_params)
    redirect_to summer_gifts_path
  end

  def destroy
    @summer_gift = SummerGift.find(params[:id])
    @summer_gift.destroy
    redirect_to summer_gifts_path
  end


  def edit
    @summer_gift = SummerGift.find(params[:id])
  end

  private
    def summer_gift_params
      params.require(:summer_gift).permit(:year, :target_number, :target_amount, :total_amount, :number, :shop_id)
    end
end
