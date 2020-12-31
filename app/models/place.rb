class Place < ApplicationRecord
  has_many :lived_ins
  has_many :persons, through: :lived_ins
end
