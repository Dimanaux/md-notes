class SubscriptionMailer < ApplicationMailer
  default from: "md_notes_notifications@example.com"

  helper :notes

  def note_notification_email(params)
    @follower = params[:follower]
    @note = params[:note]
    mail(to: @follower.email, subject: "md_notes notifications")
  end
end
