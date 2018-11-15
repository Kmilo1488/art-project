class PostsController < ApplicationController
  before_action :admin_user, :collaborator, excep: [:show]

  def index
    @posts = Post.all
  end

  def show
    @post Post.find(params[:id])
  end

  def new
    @post = Post.new(user: current_user)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "New Post Create"
    else
      render :new, alert:"Create Post Failed"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.fin(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :text)
  end
  
end
