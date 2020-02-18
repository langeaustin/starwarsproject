json.extract! person, :id, :name, :birth_year, :homeworld, :starships, :created_at, :updated_at
json.url person_url(person, format: :json)
