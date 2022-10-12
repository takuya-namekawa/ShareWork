class Post < ApplicationRecord
  belongs_to :tag
  belongs_to :shop
  has_many :comment_reviews, dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :management_favorites, dependent: :destroy
  def favorited_by?(shop)
    return false if shop.nil?#この記述をする事により、ログインが出来るようになる
    favorites.exists?(shop_id: shop.id)
  end

  def management_favorited_by?(management)
    return false if management.nil?
    management_favorites.exists?(management_id: management.id)
  end

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no-image.png")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
