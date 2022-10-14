class Shop::DayOfTheOxesController < ApplicationController
  def index
    
    @day_of_the_ox = DayOfTheOx.new
    @shop_total_amount = 0
    @shop_tptal_booking_target = 0
    @shop_store_sales_amount = 0
    
    @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
    @all_day_of_the_oxes = DayOfTheOx.all
    @day_of_the_oxes = @all_day_of_the_oxes.where(year: @current_year)
    @day_of_the_oxes = @day_of_the_oxes.order(booking_amount: :asc) if params[:sort_amount] == "booking_amount_asc"
    @day_of_the_oxes = @day_of_the_oxes.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
    @day_of_the_oxes = @day_of_the_oxes.order(booking_amount: :desc) if params[:sort_amount] == "booking_amount_desc"
    @day_of_the_oxes = @day_of_the_oxes.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
    @day_of_the_oxes = @day_of_the_oxes.page(params[:page])
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

  private
    def day_of_the_ox_params
      params.require(:day_of_the_ox).permit(:year, :booking_target,:booking_amount, :target_amount,  :store_sales_amount, :total_amount, :shop_id)
    end
end
