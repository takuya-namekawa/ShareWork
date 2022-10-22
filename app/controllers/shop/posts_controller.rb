class Shop::PostsController < ApplicationController
  before_action :set_search, only: [:index, :search]
  before_action :user_authenticate

  def index
    @posts = Post.page(params[:page])
    @post = Post.new
    @tags = Tag.all
    @post_count = Post.count

    if params[:top]
      @posts = Post.top.page(params[:page])
    elsif params[:old]
      @posts = Post.old.page(params[:page])
    else
      @posts = Post.page(params[:page])
    end
  end

  def create
    @post = Post.new(post_params)
    @post.shop_id = current_shop.id
    if @post.save
      redirect_to posts_path, notice: "投稿に成功しました"
    else
      @posts = Post.all
      render :index
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "投稿を更新しました"
    else
      @posts = Post.all
      render:index
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました"
  end

  def show
    @post = Post.find(params[:id])
    @comment = CommentReview.new
  end

  def search
    @results = @search.result
    @posts = Post.page(params[:page])
  end

  private

  def user_authenticate
    if shop_signed_in? || management_signed_in?
    else
      redirect_to root_path
    end
  end

  def set_search
    @search = Post.ransack(params[:q])
  end

  def post_params
    params.require(:post).permit(:title, :appeal, :job, :name, :tag_id, :profile_image)
  end
end
