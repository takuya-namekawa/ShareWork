class Group < ApplicationRecord
  has_many :group_shops
  has_many :shops, through: :group_shops,dependent: :destroy
  belongs_to :shop
  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no-image.png")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  validates :name, presence: true
  validates :introduction, presence: true
end
