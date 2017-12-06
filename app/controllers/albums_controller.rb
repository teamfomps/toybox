class AlbumsController < ApplicationController
  def index
    redirect_to '/recordings'
  end

  def show
    @album = Album.friendly.find(params[:id])
  end
end
