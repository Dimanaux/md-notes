class UsersController < ApplicationController
  expose_decorated :user, find_by: :username

  def show
  end

  private

  def expose_user_id_param!
    request.params[:id] = request.subdomain
  end
end
