class Favorite < ApplicationRecord
  belongs_to :shop
  belongs_to :post
end
