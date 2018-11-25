class ArtsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_user, except: [:index, :show]

  def index
    @arts = Art.all
  end

  def show
    @art = Art.find(params[:id])
  end

  def new
    @art = Art.new
  end

  # def create
  #   @art = current_user.arts.build(art_params)
  #   if @art.save
  #     redirect_to arts_path, notice: "New Art Create"
  #   else
  #     render :new, alert: "Create Art Failed"
  #   end
  # end


  def create
    artist = Artist.find(params[:artist_id])
    @art = artist.arts.create(art_params)
    if @art.save
      redirect_to root_path, notice: "New Art Create"
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

end
