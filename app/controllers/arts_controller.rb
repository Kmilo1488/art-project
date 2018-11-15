class ArtsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @arts = Art.all
  end

  def show
    @art = Art.find(params[:id])
  end

  def new
    @art = Art.new(user: current_user)
  end

  def create
    @art = current_user.arts.build(art_params)
    if @art.save
      redirect_to arts_path, notice: "New Art Create"
    else
      render :new, alert: "Create Art Failed"
    end
  end

  def edit
    @art = Art.find(params[:id])
  end

  def update
    @art = Art.find(params[:id])
    if @art.update(art_params)
      redirect_to art_path, notice: "Art edit"
    else
      render :edit
    end
  end

  def destroy
    @art = Art.find(params[:id])
    @art.destroy
    redirect_to arts_path
  end

  private

  def art_params
    params.require(:art).permit(:title, :photo, :description, :price)
  end

  def admin_user
    redirect_to root_path unless user_signed_in? && current_user.role == "admin"
  end
end
