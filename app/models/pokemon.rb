class Pokemon < ApplicationRecord
    belongs_to :generation

    has_many :pokemon_moves, dependent: :delete_all
    has_many :moves, through: :pokemon_moves
    
    has_many :pokemon_types, dependent: :delete_all
    has_many :types, through: :pokemon_types

    validates :name, :sprite, :number, presence: true

    def types_list
        self.types.map(&:name).map(&:capitalize)
    end

    def moves_list
        self.moves.map(&:name).map(&:capitalize)
    end
end
