module Authorization
  extend ActiveSupport::Concern

  included do
    include ActionPolicy::Controller
    rescue_from ActionPolicy::Unauthorized, with: :user_not_authorized
    # authorize :user, through: :current_user, optional: true
    authorize :current_user
  end

  private

  def user_not_authorized
    redirect_to(root_path)
  end
end
