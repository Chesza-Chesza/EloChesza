class GameplayersController < ApplicationController
  before_action :set_gameplayer, only: %i[ show edit update destroy ]

  # GET /gameplayers or /gameplayers.json
  def index
    @gameplayers = Gameplayer.includes(:player, :game).all
  end

  # GET /gameplayers/1 or /gameplayers/1.json
  def show
  end

  # GET /gameplayers/new
  def new
    @gameplayer = Gameplayer.new
  end

  # GET /gameplayers/1/edit
  def edit
  end

  # POST /gameplayers or /gameplayers.json
  def create
    @gameplayer = Gameplayer.new(gameplayer_params)

    respond_to do |format|
      if @gameplayer.save
        format.html { redirect_to @gameplayer, notice: "Gameplayer was successfully created." }
        format.json { render :show, status: :created, location: @gameplayer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gameplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gameplayers/1 or /gameplayers/1.json
  def update
    respond_to do |format|
      if @gameplayer.update(gameplayer_params)
        format.html { redirect_to @gameplayer, notice: "Gameplayer was successfully updated." }
        format.json { render :show, status: :ok, location: @gameplayer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gameplayer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gameplayers/1 or /gameplayers/1.json
  def destroy
    @gameplayer.destroy
    respond_to do |format|
      format.html { redirect_to gameplayers_url, notice: "Gameplayer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gameplayer
      @gameplayer = Gameplayer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gameplayer_params
      params.require(:gameplayer).permit(:rtng_change, :game_id, :player_id)
    end
end