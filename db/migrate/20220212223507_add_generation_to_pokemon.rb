class AddGenerationToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_reference :pokemons, :generation, null: false, foreign_key: true
  end
end
