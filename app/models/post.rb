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

  with_options presence: true do
    validates :title
    validates :appeal
    validates :job
    validates :name
  end

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) }

  scope :top, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }

end
