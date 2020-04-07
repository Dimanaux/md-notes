# /rails/mailers/subscription_mailer
class SubscriptionMailerPreview < ActionMailer::Preview
  def note_notification_email
    SubscriptionMailer.note_notification_email(
      follower: FactoryBot.build(:user),
      note: FactoryBot.build(:note)
    )
  end
end
