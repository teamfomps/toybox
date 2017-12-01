class InstrumentsController < ApplicationController
  def show
    @instrument = Instrument.friendly.find(params[:id])
  end
end
