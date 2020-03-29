module Subscriptions
  class Create
    include Interactor

    delegate :follower, :followee, to: :context

    def call
      follower.subscriptions << followee
    end
  end
end
