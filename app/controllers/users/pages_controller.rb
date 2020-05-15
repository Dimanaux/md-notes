module Users
  class PagesController < Users::BaseController
    skip_before_action :authenticate_user!, only: %i[index]
    skip_before_action :authorize_resource!, only: %i[index]
    skip_verify_authorized only: %i[index]

    def index
    end
  end
end
