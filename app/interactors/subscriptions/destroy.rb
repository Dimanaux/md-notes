module Subscriptions
  class Destroy
    include Interactor

    delegate :follower, :followee, to: :context

    def call
      follower.subscriptions.destroy(followee)
    end
  end
end
