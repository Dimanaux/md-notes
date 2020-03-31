class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])
  end

  private

  def user_params
    params.permit(%i[id])
  end
end
