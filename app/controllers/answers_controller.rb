class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy ]
  swagger_controller :answers, 'Answers'
  skip_before_action :verify_authenticity_token

  # GET /answers or /answers.json
  swagger_api :index do
    summary 'Returns all answers'
    notes 'Notes...'
  end
  def index
    @answers = Answer.all
  end

  # GET /answers/1 or /answers/1.json
  swagger_api :create do
    summary 'Return one answer'
    param :path, :id, :integer, :required, "Answer id"
    notes 'Notes...'
  end
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers or /answers.json
  swagger_api :create do
    summary 'Create an answer'
    param :form, "answer[answer]", :string, :required, "Answer body"
    param :form, "answer[is_correct]", :boolean, :required, "Is correct?"
    param :form, "answer[question_id]", :integer, :required, "Question_id"
    notes 'Notes...'
  end
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  swagger_api :update do
    summary 'Update an answer'
    param :path, :id, :integer, :required, "Answer id"
    param :form, "answer[answer]", :string, :required, "Answer body"
    param :form, "answer[is_correct]", :boolean, :required, "Is correct?"
    param :form, "answer[question_id]", :integer, :required, "Question_id"
    notes 'Notes...'
  end
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: "Answer was successfully updated." }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  swagger_api :destroy do
    summary 'Delete a answer'
    param :path, :id, :integer, :required, "Answer id"
    notes 'Notes...'
  end
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: "Answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:answer, :is_correct, :question_id)
    end
end
