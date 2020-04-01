module Subscriptions
  class Notify
    include Interactor

    delegate :note, to: :context

    def call
      note.user.followers.each do |follower|
        SubscriptionMailer.note_notification_email(
          follower: follower.follower, note: note
        ).deliver_later
      end
    end
  end
end
