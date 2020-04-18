class ApplicationController < ActionController::Base
  responders :flash
  respond_to :html

  include Authentication
  include BulletHelper
  include SubdomainAsUserId
end
