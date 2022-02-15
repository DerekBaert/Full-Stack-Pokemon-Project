class GenerationsController < ApplicationController
  before_action :set_generation, only: %i[ show edit update destroy ]

  # GET /generations or /generations.json
  def index
    @generations = Generation.all
  end

  # GET /generations/1 or /generations/1.json
  def show
    @generation = Generation.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generation
      @generation = Generation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def generation_params
      params.require(:generation).permit(:name, :region)
    end
end
