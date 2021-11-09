class FieldsController < ApplicationController
  before_action :set_field, only: %i[ show edit update destroy ]
  swagger_controller :fields, 'Fields'

  # GET /fields or /fields.json
  swagger_api :index do
    summary 'Returns all fields'
    notes 'Notes...'
  end
  def index
    @fields = Field.all
  end

  # GET /fields/1 or /fields/1.json
  swagger_api :show do
    summary 'return one field'
    param :path, :id, :integer, :required, "field id"
    notes 'Notes...'
  end
  def show
  end

  # GET /fields/new
  def new
    @field = Field.new
  end

  # GET /fields/1/edit
  def edit
  end

  # POST /fields or /fields.json
  swagger_api :create do
    summary 'Create a field'
    notes 'Notes...'
  end
  def create
    @field = Field.new(field_params)

    respond_to do |format|
      if @field.save
        format.html { redirect_to @field, notice: "Field was successfully created." }
        format.json { render :show, status: :created, location: @field }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fields/1 or /fields/1.json
  swagger_api :update do
    summary 'Update a field'
    param :path, :id, :integer, :required, "field id"
    notes 'Notes...'
  end
  def update
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to @field, notice: "Field was successfully updated." }
        format.json { render :show, status: :ok, location: @field }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fields/1 or /fields/1.json
  swagger_api :destroy do
    summary 'Delete a field'
    param :path, :id, :integer, :required, "field id"
    notes 'Notes...'
  end
  def destroy
    @field.destroy
    respond_to do |format|
      format.html { redirect_to fields_url, notice: "Field was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field
      @field = Field.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def field_params
      params.require(:field).permit(:name)
    end
end
