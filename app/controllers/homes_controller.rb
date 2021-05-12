class HomesController < ApplicationController
  before_action :set_home, only: %i[ show edit update destroy ]
  before_action :authenticate_admin_user!

  # GET /homes or /homes.json
  def index
    @player_stats = Gameplayer.joins(:player).group("players.elo").count
    @chartz = Gameplayer.joins(:game).group("games.winner").count

    @player = Player.includes(params[:player_id]).all
    @players = Player.all
    render json: @players
  end

  # GET /homes/1 or /homes/1.json
  def show
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes or /homes.json
  def create
    @home = Home.new(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: "Home was successfully created." }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /homes/1 or /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: "Home was successfully updated." }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1 or /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: "Home was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def dashboard
    #@tournament = Tournament.includes(params[:tournament_id]).all
    #@rounds = Round.includes(params[:tournament_id]).all
    #@games = Game.includes(params[:tournament_id]).all
    @tournament = nil
    @tournaments = Tournament.all
    @gameplayers = Gameplayer.includes([:player, game: [:round]]).all
    @player_stats = Gameplayer.joins(:player).group("players.elo").count
    @chartz = Gameplayer.joins(:game).group("games.winner").count

    respond_to do |format|
      format.html
      format.csv { send_data @user.to_csv }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.   
    def set_home
      @home = Home.find(params[:id])
    end

    def download_csv
      respond_to do |format|
        format.csv { send_data csv_file, type: 'application/csv; header=present', disposition: "attachment", filename: "output.csv"  }
      end
    end

    # Only allow a list of trusted parameters through.
    def home_params
      params.require(:home).permit(:index)
    end
end
