class PokemonType < ApplicationRecord
  belongs_to :pokemon
  belongs_to :type

  validates :pokemon, :type, presence: true
end
