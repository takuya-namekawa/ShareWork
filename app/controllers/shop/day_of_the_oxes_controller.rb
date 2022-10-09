class Shop::DayOfTheOxesController < ApplicationController
  def index
    @day_of_the_oxes = DayOfTheOx.all
    @day_of_the_ox = DayOfTheOx.new
    @shop_total_amount = 0
    @shop_tptal_booking_target = 0
    @shop_store_sales_amount = 0
  end

  def create
    @day_of_the_ox = DayOfTheOx.new(day_of_the_ox_params)
    @day_of_the_ox.shop_id = current_shop.id
    @day_of_the_ox.save
    redirect_to day_of_the_oxes_path
  end

  def update
    @day_of_the_ox = DayOfTheOx.find(params[:id])
    @day_of_the_ox.update(day_of_the_ox_params)
    redirect_to day_of_the_oxes_path
  end

  def destroy
    @day_of_the_ox = DayOfTheOx.find(params[:id])
    @day_of_the_ox.destroy
    redirect_to day_of_the_oxes_path
  end


  def edit
    @day_of_the_ox = DayOfTheOx.find(params[:id])
  end

  private
    def day_of_the_ox_params
      params.require(:day_of_the_ox).permit(:year, :booking_target,:booking_amount, :target_amount,  :store_sales_amount, :total_amount, :shop_id)
    end
end
