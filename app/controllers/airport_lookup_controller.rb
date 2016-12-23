class AirportLookupController < ApplicationController
  def index
    @airports = Airport.new(params[:country]) if params[:country].present?
    if @airports.present?
      render xml: @airports.all
    end
  end


end
