require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  responders :flash

  include Authentication
  include Authorization
  include BulletHelper
  include Pundit

  protect_from_forgery with: :exception
end
