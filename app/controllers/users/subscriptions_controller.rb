module Users
  class SubscriptionsController < ApplicationController
    expose :followee, model: User, find_by: :username
    expose :follower, -> { current_user }
    expose :subscription, build_params: :build_params

    def create
      subscription.save

      respond_with subscription, followee_location
    end

    def destroy
      subscription.destroy

      respond_with subscription, followee_location
    end

    private

    def followee_location
      { location: user_path(followee) }
    end

    def build_params
      { followee: followee, follower: current_user }
    end
  end
end
