class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[ show ]

  # GET /pokemons or /pokemons.json
  def index
    @pokemons = Pokemon.search(params[:search]).page(params[:page])
  end

  # GET /pokemons/1 or /pokemons/1.json
  def show
    @pokemon = Pokemon.find(params[:id])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_params
      params.require(:pokemon).permit(:name, :sprite, :number, :description)
    end
end
