class Type < ApplicationRecord
    belongs_to :generation
    
    has_many :moves

    has_many :pokemon_types
    has_many :pokemons, through: :pokemon_types
end
