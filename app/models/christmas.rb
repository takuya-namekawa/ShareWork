class Christmas < ApplicationRecord
  belongs_to :shop

  validates :year, presence: true, numericality: {only_integer: true}
  validates :booking_target, presence: true, numericality: {only_integer: true}
  validates :target_amount, presence: true, numericality: {only_integer: true}
  validates :booking_amount, presence: true, numericality: {only_integer: true}
  validates :store_sales_amount, presence: true, numericality: {only_integer: true}
  validates :total_amount, presence: true, numericality: {only_integer: true}
  validates :ff_amount, presence: true, numericality: {only_integer: true}

end
