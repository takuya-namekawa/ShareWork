class CommentReview < ApplicationRecord
  belongs_to :management
  belongs_to :post
end
