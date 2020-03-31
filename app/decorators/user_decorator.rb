class UserDecorator < ApplicationDecorator
  delegate :username, :email, :subscribed_to?

  def username_with_email
    "#{object.username} (#{object.email})"
  end
end
