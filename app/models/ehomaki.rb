class Ehomaki < ApplicationRecord
  belongs_to :shop

  with_options presence: true do
    validates :year
    validates :booking_target
    validates :target_amount
    validates :booking_amount
    validates :store_sales_amount
    validates :total_amount
  end
end
