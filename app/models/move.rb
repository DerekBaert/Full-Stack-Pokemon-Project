class Move < ApplicationRecord
    belongs_to :generation
    belongs_to :type

    has_many :pokemon_moves, dependent: :delete_all
    has_many :pokemons, through: :pokemon_moves

    validates :name, :damage_type, :effect, :pp, presence: true
    validates :pp, numericality: true
end
