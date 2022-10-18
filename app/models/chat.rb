class Chat < ApplicationRecord
  belongs_to :shop
  belongs_to :room

  with_options presence: true do
    validates :message
  end
end
