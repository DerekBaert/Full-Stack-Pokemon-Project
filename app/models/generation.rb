class Generation < ApplicationRecord
    has_many :moves, dependent: :delete_all
    has_many :pokemons, dependent: :delete_all
    has_many :types, dependent: :delete_all
end
