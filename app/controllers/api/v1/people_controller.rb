class Api::V1::PeopleController < ApplicationController
  def index
    people = Person.all

    render json: PersonSerializer.new(people).serializable_hash.to_json
  end
end
