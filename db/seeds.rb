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
  JSON.parse(open(url).read)
end



# Builds a person
def person_url(id)
  "https://swapi.co/api/people/#{id}"
end

char_id = 1..3

char_id.each do |character|
  person = swapi_fetch(person_url(character))

  puts "Name: #{person['name']}"
  puts "Born: #{person['birth_year']}"
  puts homeworld['name']
end

