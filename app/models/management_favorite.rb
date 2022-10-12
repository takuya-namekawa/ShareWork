class ManagementFavorite < ApplicationRecord
  belongs_to :management
  belongs_to :post
end
