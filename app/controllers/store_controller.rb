class StoreController < ApplicationController
  def index
    @kids_albums = Category.find_by(name: 'Children').albums.for_sale
    @adult_albums = Category.find_by(name: 'Adults & Families').albums.for_sale
    @instruments = Instrument.for_sale
  end
end
