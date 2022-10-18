class Shop::CommentReviewsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_management.comment_reviews.new(comment_review_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post), notice: "コメントの投稿に成功しました"
  end

  def destroy
    CommentReview.find(params[:id]).destroy
    redirect_to post_path(params[:post_id]), notice: "コメントを削除しました"
  end

  private

  def comment_review_params
    params.require(:comment_review).permit(:comment, :star)
  end
end
