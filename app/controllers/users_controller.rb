class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  swagger_controller :users, 'Users'
  skip_before_action :verify_authenticity_token

  # GET /users or /users.json
  swagger_api :index do
    summary 'Returns all users'
    notes 'Notes...'
  end


  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  swagger_api :show do
    summary 'Returns one user'
    param :path, :id, :integer, :required, "User id"
    notes 'Notes...'
  end
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  swagger_api :create do
    summary 'Create a user'
    param :form, "user[username]", :string, :required, "Username"
    param :form, "user[password]", :string, :required, "Password"
    notes 'Notes...'
  end
  def create
    @user = User.new(user_params)
  

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  swagger_api :update do
    summary 'Update a  user'
    param :path, :id, :integer, :required, "User id"
    param :form, "user[username]", :string, :required, "Username"
    param :form, "user[password]", :string, :required, "Password"
    notes 'Notes...'
  end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  swagger_api :destroy do
    summary 'Delete a user'
    param :path, :id, :integer, :required, "User id"
    notes 'Notes...'
  end
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_username(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :last_score, :password, :password_confiramtiton).tap do |set|
        set[:last_score] = 0
      end
    end
end
