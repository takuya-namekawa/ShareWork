class CreateCommentReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_reviews do |t|
      t.integer "management_id"
      t.integer "post_id"
      t.text "comment"
      t.float "star"
      t.timestamps
    end
  end
end
