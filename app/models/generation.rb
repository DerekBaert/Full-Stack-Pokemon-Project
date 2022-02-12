class Generation < ApplicationRecord
    has_many :moves
    has_many :pokemons
    has_many :types
end
