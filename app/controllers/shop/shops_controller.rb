class Shop::ShopsController < ApplicationController
  def show
    @shop = current_shop
    @shops = Shop.all
    @posts = Post.where(shop_id: @shop.id )#投稿の一覧を取得
    @count = 0
    @posts.each do |post|
      @count += post.comment_reviews.count#コメントされた投稿を数える
    end
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
