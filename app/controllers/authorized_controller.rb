class AuthorizedController < ApplicationController
  include Authorization

  before_action :authenticate_user!
  before_action :authorize_resource!

  protect_from_forgery with: :exception

  def authorize_resource!
    raise NotImplementedError
  end
end
