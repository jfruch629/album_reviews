class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    root_path = '/'
  end
end
