class SessionsController < ApplicationController
  def new
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
end
