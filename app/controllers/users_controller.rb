class UsersController < ApplicationController
  expose :user, find_by: :username

  def show
  end
end
