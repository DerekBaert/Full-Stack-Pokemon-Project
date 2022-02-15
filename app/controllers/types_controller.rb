class TypesController < ApplicationController
  before_action :set_type, only: %i[ show edit update destroy ]

  # GET /types or /types.json
  def index
    @types = Type.all
  end

  # GET /types/1 or /types/1.json
  def show
    @type = Type.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_params
      params.require(:type).permit(:name)
    end
end
