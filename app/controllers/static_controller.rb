class StaticController < ApplicationController
    swagger_controller :static, 'Static'
    swagger_api :index do
        summary 'Shows a feed for authenticated used'
        notes 'Notes...'
      end
    def index
        @users = User.all
    end

end
