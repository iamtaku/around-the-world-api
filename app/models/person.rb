class Person < ApplicationRecord
  has_many :lived_ins
  has_many :places

end
