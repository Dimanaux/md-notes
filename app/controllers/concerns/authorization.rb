module Authorization
  extend ActiveSupport::Concern

  included do
    include ActionPolicy::Controller
    rescue_from ActionPolicy::Unauthorized, with: :user_not_authorized
  end

  private

  def user_not_authorized(error)
    redirect_to(root_path, alert: error.message)
  end
end
