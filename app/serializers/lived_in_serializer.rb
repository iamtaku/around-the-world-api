class LivedInSerializer
  include JSONAPI::Serializer
  attributes :year
  has_many :places
  belongs_to :person
end
