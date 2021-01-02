class PersonSerializer
  include JSONAPI::Serializer
  attributes :name, :fb_id
  attribute :home do |object|
    "#{Place.find(object.id)}"
  end
  has_many :lived_ins
end
