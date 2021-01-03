require 'json'
require 'geocoder'

file = File.read 'db/test.json'
data = JSON.parse file

puts "Destoying all lived ins..."
LivedIn.destroy_all
puts "Destorying all places..."
Place.destroy_all
puts "Destroying all people"
Person.destroy_all
puts "\nCreating #{data['key'].count} people..."

progressbar = ProgressBar.create(
  :total => data['key'].count,
  :format => "%a %b\u{15E7}%i %p%% %t",
  :progress_mark => ' ',
  :remainder_mark => "\u{FF65}",
  :starting_at  => 10
)

data['key'].each do |item|
  hash = JSON.parse item
  # person = Person.create!(name: hash['name'], fb_id: hash['fb_id'])
  next if hash['living']['lived_in'].nil?

  hash['living']['lived_in'].each do |place|
    # place = Place.create!(location: place['place'])
    place = create_place(place)
    # lived_in = LivedIn.new(year: place['year'])
    # lived_in.place = place
    # lived_in.person = person
    # progressbar.increment if lived_in.save
    # result = Geocoder.search([place.latitude, place.longitude])
    # detailed =  result.first.address
    # country = detailed.split(', ').last
    # place.detailed = detailed
    # place.country = country
    progressbar.increment
  end
  next if hash['living']['home'].nil?

  Place.create!(location: hash['living']['home'])
  # person.save
end
puts "\n ... \n\n Created #{Person.all.count} people!"


