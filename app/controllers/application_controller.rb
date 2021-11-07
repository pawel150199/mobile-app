class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    def create 
        user = user.find_by([username: params[:session][:username]])
        if user && user.authenticate(params[:session][:password])
            #Logowanie powiodło się
            log_in user
            redirect_to user
        else
            #Logowanie nie powiodło się 
            render 'new'
        end
    end
end
