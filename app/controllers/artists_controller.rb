class ArtistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_user

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      redirect_to artist_path, notice: "New artists create"
    else
      render :new, alert: "create artist failed"
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(paramas[:id])
    if @artist.update(artist_params)
      redirect_to art_path, notice: "artist edit"
    else
      render :edit, alert: "edit failed"
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artist_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :review, :country, :region)
  end
end
