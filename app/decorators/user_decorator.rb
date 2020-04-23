class UserDecorator < ApplicationDecorator
  delegate_all

  def username_with_email
    "#{object.username} (#{object.email})"
  end

  def average_rating
    5
  end

  def notes_count
    @notes_count ||= object.notes.count
  end

  def email_md5
    Digest::MD5.hexdigest(email)
  end

  def subscription_for(other_user)
    object.subscriptions.find_by(followee: other_user)
  end

  def subscribed_to?(other_user)
    subscription_for(other_user).present?
  end
end
