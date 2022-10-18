class Shop::MotherFatherGiftsController < ApplicationController
  def index
   
    @mother_father_gift = MotherFatherGift.new
    @shop_total_target_number = 0
    @shop_tptal_target_amount = 0
    @shop_total_number = 0
    @shop_total_amount = 0
    
    @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
    @all_mother_father_gifts = SummerGift.all
    @mother_father_gifts = @all_mother_father_gifts.where(year: @current_year)
    @mother_father_gifts = @mother_father_gifts.order(number: :asc) if params[:sort_amount] == "number_asc"
    @mother_father_gifts = @mother_father_gifts.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
    @mother_father_gifts = @mother_father_gifts.order(number: :desc) if params[:sort_amount] == "number_desc"
    @mother_father_gifts = @mother_father_gifts.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
    @mother_father_gifts = @mother_father_gifts.page(params[:page])
    
  end

  def create
    @mother_father_gift = MotherFatherGift.new(mother_father_gift_params)
    @mother_father_gift.shop_id = current_shop.id
    if @mother_father_gift.save
      redirect_to mother_father_gifts_path
    else
      @mother_father_gift = MotherFatherGift.new
      @shop_total_target_number = 0
      @shop_tptal_target_amount = 0
      @shop_total_number = 0
      @shop_total_amount = 0
      
      @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
      @all_mother_father_gifts = SummerGift.all
      @mother_father_gifts = @all_mother_father_gifts.where(year: @current_year)
      @mother_father_gifts = @mother_father_gifts.order(number: :asc) if params[:sort_amount] == "number_asc"
      @mother_father_gifts = @mother_father_gifts.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
      @mother_father_gifts = @mother_father_gifts.order(number: :desc) if params[:sort_amount] == "number_desc"
      @mother_father_gifts = @mother_father_gifts.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
      @mother_father_gifts = @mother_father_gifts.page(params[:page])
      render :index
    end  
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


  private
    def mother_father_gift_params
      params.require(:mother_father_gift).permit(:year, :target_number, :target_amount, :total_amount, :number, :shop_id)
    end
end
