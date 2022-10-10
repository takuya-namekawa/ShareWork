class Chat < ApplicationRecord
  belongs_to :shop
  belongs_to :room
end
