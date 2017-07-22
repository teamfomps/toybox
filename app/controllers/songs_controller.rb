class SongsController < ApplicationController
  def show
    @song = Album.friendly.find(params[:album_id]).songs.friendly.find(params[:id])
  end
end
