class PagesController < ApplicationController
  def album_redirect
    redirect_to '/albums/' + params['uri']
  end

  def instrument_redirect
    redirect_to '/instruments/' + params['uri']
  end
end
