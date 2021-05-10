class CalculatesController < ApplicationController
  # before_action :set_calculate, only: %i[ create show edit update destroy ]

  def index
    @tournament = Tournament.includes(params[:tournament_id]).all
    @tournaments = Tournament.all
    @rounds = Round.includes(params[:tournament_id]).all
    @games = Game.includes(params[:tournament_id]).all
    @gameplayers = Gameplayer.includes([:player, game: [:round]]).all
    @player_stats = Gameplayer.joins(:player).group("players.elo").count
    @chartz = Gameplayer.joins(:game).group("games.winner").count
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