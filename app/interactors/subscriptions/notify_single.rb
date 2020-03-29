module Subscriptions
  class NotifySingle
    include Interactor

    delegate :note, :follower, to: :context

    def call
      SubscriptionMailer.note_notification_email(
        follower: follower, note: note
      ).deliver_later
    end
  end
end
