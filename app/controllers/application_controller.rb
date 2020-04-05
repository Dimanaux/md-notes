class ApplicationController < ActionController::Base
  responders :flash
  respond_to :html

  include Authentication
  include Authorization
  include BulletHelper

  protect_from_forgery with: :exception
end
