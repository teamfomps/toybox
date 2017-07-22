class AlbumsController < ApplicationController
  def show
    @album = Album.friendly.find(params[:id])
  end
end
