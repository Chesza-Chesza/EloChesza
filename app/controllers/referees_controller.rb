class RefereesController < ApplicationController
  before_action :set_referee, only: %i[ show edit update destroy ]
  before_action :authenticate_admin_user!

  # GET /referees or /referees.json
  def index
    @referees = Referee.all
  end

  # GET /referees/1 or /referees/1.json
  def show
  end

  # GET /referees/new
  def new
    @referee = Referee.new
  end

  # GET /referees/1/edit
  def edit
  end

  # POST /referees or /referees.json
  def create
    @referee = Referee.new(referee_params)

    respond_to do |format|
      if @referee.save
        format.html { redirect_to @referee, notice: "Referee was successfully created." }
        format.json { render :show, status: :created, location: @referee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @referee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referees/1 or /referees/1.json
  def update
    respond_to do |format|
      if @referee.update(referee_params)
        format.html { redirect_to @referee, notice: "Referee was successfully updated." }
        format.json { render :show, status: :ok, location: @referee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @referee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referees/1 or /referees/1.json
  def destroy
    @referee.destroy
    respond_to do |format|
      format.html { redirect_to referees_url, notice: "Referee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referee
      @referee = Referee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def referee_params
      params.require(:referee).permit(:fide_id, :name, :title)
    end
end
