module Users
  class BaseController < ApplicationController
    include Authorization

    before_action :authenticate_user!
    before_action :authorize_resource!

    protect_from_forgery with: :exception

    def authorize_resource!
      raise NotImplementedError
    end

    helper_method :current_author

    def current_author
      @current_author ||= User.find_by(username: request.subdomain).decorate
    end
  end
end
