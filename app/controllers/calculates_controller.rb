class CalculatesController < ApplicationController
  def index
    #@calculates = Calculate.all
    # @calculate = Elo::Calculate.init(@player, @opponent, @points, @k_value, @percentage)
  end

  def create
    calculate = Elo::Calculate.init(@player, @opponent, @points, @k_value, @percentage)
  end

    private

    # Only allow a list of trusted parameters through.
    def calulate_params
      params.require(:calculate).permit(:player, :opponent, :points, :k_value, :percentage)
    end
end
