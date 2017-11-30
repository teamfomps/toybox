class StoreController < ApplicationController
  def index
    @kids_albums = Category.find_by(name: 'Children').albums
    @adult_albums = Category.find_by(name: 'Adults & Families').albums
    @instruments = Instrument.all
  end
end
