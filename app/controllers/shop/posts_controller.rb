class Shop::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    @post.shop_id = current_shop.id
    @post.save
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :appeal, :job, :name, :tag_id, :profile_image)
    end
end
