json.extract! pokemon, :id, :name, :sprite, :number, :description, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
