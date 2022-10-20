class Shop::PostsController < ApplicationController
  before_action :set_search, only: [:index, :search]

  def index
    @posts = Post.all
    @post = Post.new
    @tags = Tag.all
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
  end

  private

  def set_search
    @search = Post.ransack(params[:q])
  end


  def post_params
    params.require(:post).permit(:title, :appeal, :job, :name, :tag_id, :profile_image)
  end
end
