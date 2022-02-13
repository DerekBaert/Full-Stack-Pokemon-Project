class Pokemon < ApplicationRecord
    belongs_to :generation

    has_many :pokemon_moves, dependent: :delete_all
    has_many :moves, through: :pokemon_moves
    
    has_many :pokemon_types, dependent: :delete_all
    has_many :types, through: :pokemon_types
end
