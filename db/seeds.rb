require 'json'

puts "Destoying all lived ins..."
LivedIn.destroy_all
puts "Destorying all places..."
Place.destroy_all
puts "Destroying all people"
Person.destroy_all

file = File.read 'db/test.json'
data = JSON.parse file

puts "\nCreating #{data['key'].count} people..."
progressbar = ProgressBar.create(
  :total => data['key'].count,
  :format => "%a %b\u{15E7}%i %p%% %t",
  :progress_mark  => ' ',
  :remainder_mark => "\u{FF65}",
  :starting_at    => 10
)



data['key'].each do |item|
  hash = JSON.parse item

  person = Person.create!(name: hash['name'], fb_id: hash['fb_id'])
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

  progressbar.increment
  # puts "Created #{person.name}"
end
puts "\n ... \n\n Created #{Person.all.count} people!"
