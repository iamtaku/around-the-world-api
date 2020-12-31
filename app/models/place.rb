class Place < ApplicationRecord
  has_many :persons, through: :lived_ins
end
