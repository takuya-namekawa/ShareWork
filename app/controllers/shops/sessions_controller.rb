class Shops::SessionsController < Devise::SessionsController
  def guest_sign_in
    shop = Shop.guest
    sign_in shop
    redirect_to posts_path,notice: "GestShopでログインしました"
  end
end