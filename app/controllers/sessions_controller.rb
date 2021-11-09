class SessionsController < ApplicationController
  swagger_controller :sessions, 'Sessions'


  def new
  end

  swagger_api :create do
    summary 'Login to user'
    notes 'Notes...'
  end
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      #Logowanie przebiegło poprawnie 

    else
      #Logowanie się nie udało
      render 'new'
    end
  end

  swagger_api :destroy do
    summary 'Logout'
    notes 'Notes...'
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
