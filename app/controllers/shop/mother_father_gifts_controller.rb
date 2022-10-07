class Shop::MotherFatherGiftsController < ApplicationController
  def index
    @mother_father_gifts = MotherFatherGift.all
    @mother_father_gift = MotherFatherGift.new
  end

  def create
    @mother_father_gift = MotherFatherGift.new(mother_father_gift_params)
    @mother_father_gift.shop_id = current_shop.id
    @mother_father_gift.save
    redirect_to mother_father_gifts_path
  end

  def update
    @mother_father_gift = MotherFatherGift.find(params[:id])
    @mother_father_gift.update(mother_father_gift_params)
    redirect_to mother_father_gifts_path
  end

  def destroy
    @mother_father_gift = MotherFatherGift.find(params[:id])
    @mother_father_gift.destroy
    redirect_to mother_father_gifts_path
  end


  def edit
    @mother_father_gift = MotherFatherGift.find(params[:id])
  end

  private
    def mother_father_gift_params
      params.require(:mother_father_gift).permit(:year, :target_number, :target_amount, :total_amount, :number, :shop_id)
    end
end
