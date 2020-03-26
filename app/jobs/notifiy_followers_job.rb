class NotifiyFollowersJob < ApplicationJob
  queue_as :default

  def perform(user, note)
    SubscriptionMailer.note_notification_email(user, note).deliver_later
  end
end
