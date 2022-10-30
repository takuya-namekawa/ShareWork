class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :mother_father_gifts, dependent: :destroy
  has_many :summer_gifts, dependent: :destroy
  has_many :year_end_gifts, dependent: :destroy
  has_many :day_of_the_oxes, dependent: :destroy
  has_many :ehomakis, dependent: :destroy
  has_many :christmases, dependent: :destroy
  has_many :shop_rooms
  has_many :chats
  has_many :favorites,dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :group_shops
  has_many :groups, through: :group_shops,dependent: :destroy
  has_many :owned_groups, class_name: "Group"  #グループとグループオーナーの関係は、class_nameを使用して書く。
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no-image.png")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.guest
    find_or_initialize_by(email: "guest@guest.com") do |shop|
      shop.attributes = { password: SecureRandom.urlsafe_base64,
                           name: "guestshop" }
      shop.save
    end
  end


end
