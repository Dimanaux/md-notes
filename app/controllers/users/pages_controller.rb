module Users
  class PagesController < ApplicationController
    expose_decorated :user, find_by: :username

    def index
    end
  end
end
