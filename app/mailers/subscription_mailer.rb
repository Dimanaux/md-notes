class SubscriptionMailer < ApplicationMailer
  default from: "md_notes_notifications@example.com"

  def note_notification_email
    @user = params[:user]
    @note = params[:note]
    mail(to: @user.email, subject: "Welcome to My Awesome Site")
  end
end
