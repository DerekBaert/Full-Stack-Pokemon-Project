class MovesController < ApplicationController
  before_action :set_move, only: %i[ show edit update destroy ]

  # GET /moves or /moves.json
  def index
    @moves = Move.all.page(params[:page])
  end

  # GET /moves/1 or /moves/1.json
  def show
    @move = Move.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_move
      @move = Move.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def move_params
      params.require(:move).permit(:name, :accuracy, :damage_type, :effect, :power, :pp)
    end
end
