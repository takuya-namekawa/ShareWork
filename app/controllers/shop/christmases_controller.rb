class Shop::ChristmasesController < ApplicationController
  def index
    @christmases = Christmas.all
    @christmas = Christmas.new
    @shop_total_amount = 0
    @shop_tptal_booking_target = 0
    @shop_store_sales_amount = 0
  end

  def create
    @christmas = Christmas.new(christmas_params)
    @christmas.shop_id = current_shop.id
    @christmas.save
    redirect_to christmases_path
  end

  def update
    @christmas = Christmas.find(params[:id])
    @christmas.update(christmas_params)
    redirect_to christmases_path
  end

  def destroy
    @christmas = Christmas.find(params[:id])
    @christmas.destroy
    redirect_to christmases_path
  end


  def edit
    @christmas = Christmas.find(params[:id])
  end

  private
    def christmas_params
      params.require(:christmas).permit(:year, :booking_target,:booking_amount, :target_amount,  :store_sales_amount, :total_amount, :shop_id, :ff_amount)
    end
end
