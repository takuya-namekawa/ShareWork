class Shop::EhomakisController < ApplicationController
  def index
    @ehomakis = Ehomaki.all
    @ehomaki = Ehomaki.new
  end

  def create
    @ehomaki = Ehomaki.new(ehomaki_params)
    @ehomaki.shop_id = current_shop.id
    @ehomaki.save
    redirect_to ehomakis_path
  end

  def update
    @ehomaki = Ehomaki.find(params[:id])
    @ehomaki.update(ehomaki_params)
    redirect_to ehomakis_path
  end

  def destroy
    @ehomaki = Ehomaki.find(params[:id])
    @ehomaki.destroy
    redirect_to ehomakis_path
  end


  def edit
    @ehomaki = Ehomaki.find(params[:id])
  end

  private
    def ehomaki_params
      params.require(:ehomaki).permit(:year, :booking_target,:booking_amount, :target_amount,  :store_sales_amount, :total_amount, :shop_id)
    end
end
