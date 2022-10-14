class Shop::ChristmasesController < ApplicationController
  def index

    @christmas = Christmas.new
    @shop_total_amount = 0
    @shop_tptal_booking_target = 0
    @shop_store_sales_amount = 0
    # モデル名.order(カラム名: "DESC")
    @current_year = params[:current_year].present? ? params[:current_year] : Time.zone.now.year
    @all_christmases = Christmas.all
    @christmases = @all_christmases.where(year: @current_year)
    @christmases = @christmases.order(booking_amount: :asc) if params[:sort_amount] == "booking_amount_asc"
    @christmases = @christmases.order(total_amount: :asc) if params[:sort_amount] == "total_amount_asc"
    @christmases = @christmases.order(booking_amount: :desc) if params[:sort_amount] == "booking_amount_desc"
    @christmases = @christmases.order(total_amount: :desc) if params[:sort_amount] == "total_amount_desc"
    @christmases = @christmases.page(params[:page])

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
