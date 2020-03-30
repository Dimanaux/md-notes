module Subscriptions
  class Notify
    include Interactor

    delegate :note, to: :context

    def call
      note.user.followers.each do |follower|
        NotifySingle.call(follower: follower.follower, note: note)
      end
    end
  end
end
