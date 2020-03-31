module Users
  class SubscriptionsController < ApplicationController
    expose :user, find_by: :username

    def create
      ::Subscriptions::Create.call(
        followee: user, follower: current_user
      )
    end

    def destroy
      ::Subscriptions::Destroy.call(
        followee: user, follower: current_user
      )
    end
  end
end
