class UserDecorator < ApplicationDecorator
  delegate_all

  def username_with_email
    "#{object.username} (#{object.email})"
  end

  def subscription_for(other_user)
    object.followees_subscriptions.find_by(followee: other_user)
  end

  def subscribed_to?(other_user)
    subscription_for(other_user).present?
  end
end
