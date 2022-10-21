class Shop::ShopsController < ApplicationController
  def show
    @shop = current_shop
    @shops = Shop.all
    @posts = @shop.posts.page(params[:page]).reverse_order
    @today_post = @posts.created_today
    @yesterday_post = @posts.created_yesterday
    @this_week_post = @posts.created_this_week
    @last_week_post = @posts.created_last_week
  end

  def edit
    @shop = current_shop
  end

  def update
    @shop = current_shop
    @shop.update(shop_params)
    redirect_to my_page_shops_path, notice: "情報を更新しました"
  end

  private
    def shop_params
      params.require(:shop).permit(:name, :email, :profile_image)
    end
end
