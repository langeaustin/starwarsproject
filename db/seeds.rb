# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

# Fetches and decodes JSON from SWAPI
def swapi_fetch(url)
  JSON.parse(URI(url).read)
end

Person.destroy_all
Planet.destroy_all
Vehicle.destroy_all

# Builds a person
def person_url(id)
  "https://swapi.co/api/people/#{id}"
end

def vehicle_url(id)
  "https://swapi.co/api/vehicles/#{id}"
end

def planet_url(id)
  "https://swapi.co/api/planets/#{id}"
end

#Format an UL of vehicles
def vehicle_name_list(vehicles)
  vehicle_names = vehicles.map { |v| v['name'] }
  vehicle_names.join(', ')
end

count = 1..9
require 'pp'
count.each do |pagenumber|

  char_id = swapi_fetch("https://swapi.co/api/people/?page=#{pagenumber}")['results']

  #  pp char_id

  char_id.each do |character|
    person = swapi_fetch(character['url'])
    homeworld = swapi_fetch(person['homeworld'])
    vehicles = person['vehicles'].map { |vehicles_url| swapi_fetch(vehicles_url) }

    unless homeworld.empty?
    h = Planet.find_or_create_by(name: homeworld['name'], terrain: homeworld['terrain'], climate: homeworld['climate'])
    end

    unless person.empty?
    p = h.people.create(name: person['name'], birth_year: person['birth_year'], homeworld: homeworld['name'])
    end

    unless vehicles.empty?
      vehicles.map {|vehicle|
        v = Vehicle.find_or_create_by(name: vehicle['name'], model: vehicle['model'])
        p.vehicles << v}
    end


#  puts "Name: #{person['name']}"
#  puts "Born: #{person['birth_year']}"
#  puts "homeworld: #{homeworld['name']} "
#  puts "vehicles: #{vehicle_name_list(vehicles)}"
  end
end
puts Person.count

puts Vehicle.count



