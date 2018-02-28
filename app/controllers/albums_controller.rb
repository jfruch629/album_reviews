class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  def index
    @albums = Album.all
    root_path = '/'
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def show
    @album = Album.find(params[:id])
  end

  def create
  @album = Album.new(album_params)

  respond_to do |format|
    if @album.save
      format.html { redirect_to @album, notice: 'Album was successfully created' }
      format.json { render :show, status: :created, location: @album }
    else
      format.html { render :'/albums/new' }
      format.json { render json: @question.errors, status: :unprocessable_entity }
    end
  end
end

def update
  if @album.update(album_params)
    redirect_to @album, notice: 'Album Updated.'
  else
    render :edit
  end
end

  private
  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :artist, :summary, :genre, :starting_year, :tracks)
  end
end
