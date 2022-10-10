class Shop::ShopsController < ApplicationController
  def show
    @shop = current_shop
    @shops = Shop.all
  end

  def edit
    @shop = current_shop
  end

  def update
    @shop = current_shop
    @shop.update(shop_params)
    redirect_to my_page_shops_path
  end

  private
    def shop_params
      params.require(:shop).permit(:name, :email, :profile_image)
    end
end
