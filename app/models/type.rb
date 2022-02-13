class Type < ApplicationRecord
    belongs_to :generation
    
    has_many :moves, dependent: :delete_all

    has_many :pokemon_types, dependent: :delete_all
    has_many :pokemons, through: :pokemon_types
end
