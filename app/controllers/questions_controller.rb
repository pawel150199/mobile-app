class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  swagger_controller :questions, 'Questions'
  skip_before_action :verify_authenticity_token

  # GET /questions or /questions.json
  swagger_api :index do
    summary 'Retturns all questions'
    notes 'Notes...'
  end
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  swagger_api :show do
    summary 'Retturns one question'
    param :path, :id, :integer, :required, "question id"
    notes 'Notes...'
  end
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  swagger_api :create do
    summary 'Create a  question'
    param :form, "question[question]", :string, :required, "Question"
    param :form, "question[field_id]", :integer, :required, "Field id"
    notes 'Notes...'
  end
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  swagger_api :update do
    summary 'Update a  question'
    param :path, :id, :integer, :required, "question id"
    param :form, "question[question]", :string, :required, "Question"
    param :form, "question[field_id]", :integer, :required, "Field id"
    notes 'Notes...'
  end
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  swagger_api :destroy do
    summary 'Delete a  question'
    param :path, :id, :integer, :required, "question id"
    notes 'Notes...'
  end
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question, :field_id)
    end
end
