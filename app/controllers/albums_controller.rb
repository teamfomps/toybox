class AlbumsController < ApplicationController
  def index
    redirect to '/recordings'
  end
  
  def show
    @album = Album.friendly.find(params[:id])
  end
end
