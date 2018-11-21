class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :collaborator_user, except: [:index, :show]
  before_action :post_owner, only: [:edit, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(owner: current_user)
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
    owner = @post.owner_id == current_user.id
    if owner != true || admin_user == false
      flash[:alert] = "No eres el creador"
      render :show
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path, notice: "Post edit"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    owner = @post.owner_id == current_user.id
    if owner == true || admin_user
      @post.destroy
      render :index
    else
      flash[:alert] = "No eres el creador"
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :text)
  end

end
