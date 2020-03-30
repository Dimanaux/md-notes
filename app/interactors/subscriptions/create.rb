module Subscriptions
  class Create
    include Interactor

    delegate :follower, :followee, to: :context

    def call
      Subscription.create(follower: follower, followee: followee)
    end
  end
end
