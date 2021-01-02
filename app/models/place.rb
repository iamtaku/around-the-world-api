class Place < ApplicationRecord
  # has_many :lived_ins
  # has_many :persons, through: :lived_ins
  # belongs_to :person
  geocoded_by :location
  after_validation :geocode

end
