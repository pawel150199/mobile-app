class SessionsController < ApplicationController
  swagger_controller :session, 'Authentication'
  skip_before_action :verify_authenticity_token


  def new
  end

  swagger_api :create do
    summary 'Login to user'
    param :form, "session[username]", :string, :required, "Username"
    param :form, "session[password]", :string, :required, "Password"
    notes 'Notes...'
  end
  def create
    respond_to do |format|
      user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        format.html {
          #Logowanie przebiegło poprawnie 
          log_in user
          redirect_to user

        }
        format.json {
          user.password = params[:session][:password]
          user.regenerate_token
          render json: { token: user.token}
        }
      else
        format.html {
          #Logowanie się nie udało
          render 'new'
        }
        format.json {
          render json: { message: 'Niepoprawne dane' }
        }
      end
    end
  end

  swagger_api :destroy do
    summary 'Logout'
    notes 'Notes...'
  end
  def destroy
    respond_to do |format|
      format.html do
        log_out
        redirect_to root_url
      end
      format.json do
        require_token
        if current_user
          current_user.invalidate_token
          head :ok
        end
      end
    end
  end
end
