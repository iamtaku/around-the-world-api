require 'json'

puts "Destoying all lived ins..."
LivedIn.destroy_all
puts "Destorying all places..."
Place.destroy_all
puts "Destroying all people"
Person.destroy_all

file = File.read 'db/test.json'
# data = JSON.load file
data = JSON.parse file
# puts data['key'].each do |hash|
#   puts hash
# end
# test =  json_data['key'].first
# p JSON.parse test



data['key'].each do |item|
  hash = JSON.parse item

  person = Person.create!(name: hash['name'], fb_id: hash['fb_id'])
  # puts hash['living']
  # test = hash["living"]
  p hash
  # p hash['living']['lived_in']
  next if hash['living']['lived_in'].nil?

  hash['living']['lived_in'].each do |place|
      place = Place.create!(location: place['place'])
      livedIn = LivedIn.new(year: place['year'])
      livedIn.place = place
      livedIn.person = person
      livedIn.save
  end
  next if hash['living']['home'].nil?
  person.home = hash['living']['home']
  person.save

end
puts "Created #{Person.all.count} people!"
# Person.destroy_all
# Place.destroy_all
# LivedIn.destroy_all

# person = Person.create!(name:'taku')
# place = Place.create!(location:'Gifu')
# place2 = Place.create!(location:'Tokyo')
# lived_in = LivedIn.new(year: 2020)
# lived_in.place = place
# lived_in.person = person
# lived_in.save
# person.lived_ins
