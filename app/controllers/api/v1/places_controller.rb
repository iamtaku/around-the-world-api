class Api::V1::PlacesController < ApplicationController
  def index
    places = Place.all

    render json: PlaceSerializer.new(places).serializable_hash.to_json
  end
end
