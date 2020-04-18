module SubdomainAsUserId
  extend ActiveSupport::Concern

  included do
    before_action :expose_user_id_param!
  end

  def expose_user_id_param!
    request.params[:user_id] = request.subdomain
  end
end
