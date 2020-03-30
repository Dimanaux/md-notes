module Subscriptions
  class Destroy
    include Interactor

    delegate :follower, :followee, to: :context

    def call
      Subscription.find_by(follower: follower, followee: followee).destroy
    end
  end
end
