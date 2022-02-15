#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# require "poke-api-v2"
# require 'rest-client'
require 'open-uri'
require "json"

# https://pokeapi.co/api/v2/pokemon/?limit=899

# pokemons = JSON.parse('https://pokeapi.co/api/v2/pokemon/?limit=899') 
PokemonType.delete_all
PokemonMove.delete_all
Move.delete_all
Pokemon.delete_all
Type.delete_all
Generation.delete_all
# Fetches JSON resource
def fetch(url)
    JSON.parse(URI.open(url).read)
end

# Fetching the three big tables which belong to Generation  
pokeFetch = fetch('https://pokeapi.co/api/v2/pokemon/?limit=898')['results']
typeFetch = fetch('https://pokeapi.co/api/v2/type/?limit=18')['results']
moveFetch = fetch('https://pokeapi.co/api/v2/move/?limit=826')['results']

typeFetch.each do |t|
    typeData = fetch(t['url'])
    typeGen = Generation.find_or_create_by(
        name: typeData['generation']['name'], 
        region: fetch(typeData['generation']['url'])['main_region']['name']
    )
    type = typeGen.types.find_or_create_by(name: typeData['name'])
end

moveFetch.each do |m|
    moveData = fetch(m['url'])
    moveTypeGen = Generation.find_or_create_by(
        name: fetch(moveData['type']['url'])['generation']['name'],
        region: fetch(fetch(moveData['type']['url'])['generation']['url'])['main_region']['name']
    )
    
    moveType = moveTypeGen.types.find_or_create_by(name: moveData['type']['name'])
    moveGen = Generation.find_or_create_by(
        name: moveData['generation']['name'],
        region: fetch(moveData['generation']['url'])['main_region']['name']
    )
    
    # puts "Name: #{moveData['name']}\nAccuracy: #{moveData['accuracy']}\nDamage Type: #{moveData['damage_class']['name']}\nEffect: #{moveData['effect_entries'][0]['effect'].strip}\nPower: #{moveData['power']}\nPP: #{moveData['pp']}\nGeneration ID: #{moveGen.id}"
    flavor = "None"
    moveData['flavor_text_entries'].each do |entry|
        if(entry['language']['name'] == "en")
            flavor = entry['flavor_text']
            break
        end
    end
    move = moveType.moves.find_or_create_by(
        name: moveData['name'],
        accuracy: moveData['accuracy'],
        damage_type: moveData['damage_class']['name'],
        effect: flavor,
        power: moveData['power'],
        pp: moveData['pp'],
        generation_id: moveGen.id
    )
end

pokeFetch.each do |poke|
    pokeData = fetch(poke['url'])
    species = fetch(pokeData['species']['url'])
    genFetch = fetch(species['generation']['url'])
    generation = Generation.find_or_create_by(name: genFetch['name'], region: genFetch['main_region']['name'])

    entries = species['flavor_text_entries']
    entry = ""
    entries.each do |e|
        if(e['language']['name'] == "en")
            entry = e['flavor_text']
            break
        end
    end   

    if generation && generation.valid?
        pokemon = generation.pokemons.create(
            name: pokeData['name'],
            sprite: pokeData['sprites']['front_default'],
            number: pokeData['id'],
            description: entry
        )
        
        pokeData['types'].each do |t|
            pokeType = PokemonType.find_or_create_by(
                pokemon_id: pokemon.id, 
                type_id: Type.find_by(name: t['type']['name']).id
            )
        end

        pokeData['moves'].each do |m|
            pokeMove = PokemonMove.find_or_create_by(
                pokemon_id: pokemon.id, 
                move_id: Move.find_by(name: m['move']['name']).id
            )            
        end    
    end       
end

