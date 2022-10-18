class MotherFatherGift < ApplicationRecord
  belongs_to :shop

  with_options presence: true do
    validates :year
    validates :target_number
    validates :target_amount
    validates :total_amount
    validates :number
  end
end
