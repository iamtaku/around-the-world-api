require 'json'

# file = File.open 'test.json'
# data = JSON.load file
Person.destroy_all
Place.destroy_all
LivedIn.destroy_all

person = Person.create!(name:'taku')
place = Place.create!(location:'Gifu')
place2 = Place.create!(location:'Tokyo')
lived_in = LivedIn.new(year: 2020)
lived_in.place = place
lived_in.person = person
lived_in.save
person.lived_ins
