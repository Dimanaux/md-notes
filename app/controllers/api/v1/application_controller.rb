module Api
  module V1
    class ApplicationController < ActionController::Base
      respond_to :json

      include Authentication
      include Authorization
      include BulletHelper

      protect_from_forgery with: :exception

      before_action :authenticate_user!
      before_action :authorize_resource!
    end
  end
end
