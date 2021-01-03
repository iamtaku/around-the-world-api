class Place < ApplicationRecord
  # has_many :lived_ins
  # has_many :persons, through: :lived_ins
  # belongs_to :person
  geocoded_by :location
  after_validation :geocode
  # after_validation :create_place
  before_save :create_place

  private

  def create_place
    place = self
    puts place
    result = Geocoder.search([place.latitude, place.longitude])
    detailed = result.first.address
    country = detailed.split(', ').last
    place.detailed = detailed
    place.country = country
  end
end
