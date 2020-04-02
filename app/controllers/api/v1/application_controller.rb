module Api
  module V1
    class ApplicationController < ActionController::Base
      respond_to :json

      include Authentication
      include Authorization
      include BulletHelper

      protect_from_forgery with: :exception
    end
  end
end
