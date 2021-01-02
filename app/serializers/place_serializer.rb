class PlaceSerializer
  include JSONAPI::Serializer
  attributes :location, :latitude, :longitude
  # has_many :lived_ins
  # has_many :persons, through: :lived_ins
end
