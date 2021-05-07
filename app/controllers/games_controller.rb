class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  before_action :set_round

  # GET /games or /games.json
  def index
    @games = @round.games
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @round = Round.find(params[:round_id])
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to tournament_rounds_path, notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
        format.csv { send_data @game.to_csv }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
    
    
    # respond_to do |format|
    #   format.html
    #   format.csv { send_data @user.to_csv }
    # end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to round_game_path(@round), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to @game, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    def set_round
      @round = Round.find(params[:round_id])
    end

    def download_csv
      respond_to do |format|
        format.csv { send_data csv_file, type: 'application/csv; header=present', disposition: "attachment", filename: "output.csv"  }
      end
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:player1_id, :player2_id, :result, :won, :round_id, :tournament_id, :file_csv)
    end
end
