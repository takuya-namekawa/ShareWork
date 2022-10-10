class Room < ApplicationRecord
  has_many :shop_rooms
  has_many :chats
end
