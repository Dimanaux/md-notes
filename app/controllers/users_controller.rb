class UsersController < ApplicationController
  expose_decorated :user, find_by: :username

  def show
  end
end
