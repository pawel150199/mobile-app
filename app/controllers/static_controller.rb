class StaticController < ApplicationController
    swagger_controller :static, 'Static'
    before_action :require_token, only: [:feed]
    swagger_api :index do
        summary 'Shows a feed for authenticated used'
        notes 'Notes...'
      end

    def index
        @users = User.all
    end

    def feed
        
    end

end
