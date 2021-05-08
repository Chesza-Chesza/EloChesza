class RoundsController < ApplicationController
  before_action :set_round, only: %i[ show edit update destroy ]
  before_action :set_tournament
  before_action :authenticate_admin_user!

  # GET /rounds or /rounds.json
  def index
    @rounds = @tournament.rounds
  end

  # GET /rounds/1 or /rounds/1.json
  def show
  end

  # GET /rounds/new
  def new
    @round = Round.new
    @tournament = Tournament.find(params[:tournament_id])
  end

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds or /rounds.json
  def create
    @tournament = Tournament.find(params[:tournament_id])
    @round = Round.new(round_params)
    @round.tournament_id = @tournament.id

    respond_to do |format|
      if @round.save
        format.html { redirect_to tournament_path(@tournament), notice: "Round was successfully created." }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rounds/1 or /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to @round, notice: "Round was successfully updated." }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1 or /rounds/1.json
  def destroy
    @round.destroy
    respond_to do |format|
      format.html { redirect_to rounds_url, notice: "Round was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    def set_tournament
      @tournament = Tournament.find(params[:tournament_id])
    end

    def set_breadcrums
    end
    
    # Only allow a list of trusted parameters through.
    def round_params
      params.require(:round).permit(:date, :number, :tournament_id)
    end
end
