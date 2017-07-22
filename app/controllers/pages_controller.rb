class PagesController < ApplicationController
  def album_redirect
    redirect_to '/albums/' + params['uri']
  end
end
