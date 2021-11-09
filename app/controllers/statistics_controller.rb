class StatisticsController < ApplicationController
  before_action :set_statistic, only: %i[ show edit update destroy ]
  swagger_controller :statistics, 'Statistics'

  # GET /statistics or /statistics.json
  swagger_api :index do
    summary 'Returns all statistics'
    notes 'Notes...'
  end
  def index
    @statistics = Statistic.all
  end

  # GET /statistics/1 or /statistics/1.json
  swagger_api :show do
    summary 'Returns one  statistic'
    param :path, :id, :integer, :required, "Statistic id"
    notes 'Notes...'
  end
  def show
  end

  # GET /statistics/new
  def new
    @statistic = Statistic.new
  end

  # GET /statistics/1/edit
  def edit
  end

  # POST /statistics or /statistics.json
  swagger_api :create do
    summary 'Create a statistic'
    notes 'Notes...'
  end
  def create
    @statistic = Statistic.new(statistic_params)

    respond_to do |format|
      if @statistic.save
        format.html { redirect_to @statistic, notice: "Statistic was successfully created." }
        format.json { render :show, status: :created, location: @statistic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statistics/1 or /statistics/1.json
  swagger_api :update do
    summary 'Update a statistic'
    param :path, :id, :integer, :required, "Statistic id"
    notes 'Notes...'
  end
  def update
    respond_to do |format|
      if @statistic.update(statistic_params)
        format.html { redirect_to @statistic, notice: "Statistic was successfully updated." }
        format.json { render :show, status: :ok, location: @statistic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics/1 or /statistics/1.json

  swagger_api :destroy do
    summary 'Delete a statistic'
    param :path, :id, :integer, :required, "Statistic id"
    notes 'Notes...'
  end
  def destroy
    @statistic.destroy
    respond_to do |format|
      format.html { redirect_to statistics_url, notice: "Statistic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statistic
      @statistic = Statistic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def statistic_params
      params.require(:statistic).permit(:pointer, :answer_id, :question_id, :user_id)
    end
end
