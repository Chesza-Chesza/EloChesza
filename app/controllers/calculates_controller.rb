class CalculatesController < ApplicationController
  # before_action :set_calculate, only: %i[ create show edit update destroy ]

  def index
    #@calculates = Calculate.all
  end

  def create 
    @calculate = Elo::Calculate.init(calculate_params[:player].to_i, 
                                     calculate_params[:opponent].to_i, 
                                     calculate_params[:points].to_f, 
                                     calculate_params[:k_value].to_i)

    respond_to do |format|
      format.js
    end
  end

    private
    # def set_calculate
    #   @calculate = Calculate.find(calculate_params)
    # end

    # Only allow a list of trusted parameters through.
    def calculate_params
      params.require(:calculate).permit(:player, :opponent, :points, :k_value)
    end
end
