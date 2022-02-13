class Pokemon < ApplicationRecord
    belongs_to :generation

    has_many :pokemon_moves
    has_many :moves, through: :pokemon_moves
    
    has_many :pokemon_types
    has_many :types, through: :pokemon_types
end
