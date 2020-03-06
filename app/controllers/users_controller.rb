class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
  end

  private

  def user_params
    params.permit(%i[username])
  end
end
