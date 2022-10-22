class YearEndGift < ApplicationRecord
  belongs_to :shop

  validates :year, presence: true, numericality: {only_integer: true}
  validates :target_amount, presence: true, numericality: {only_integer: true}
  validates :target_number, presence: true, numericality: {only_integer: true}
  validates :total_amount, presence: true, numericality: {only_integer: true}
  validates :number, presence: true, numericality: {only_integer: true}
end
