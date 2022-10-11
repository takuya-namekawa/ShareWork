class Favorite < ApplicationRecord
  belongs_to :shop_params
  belongs_to :post
end
