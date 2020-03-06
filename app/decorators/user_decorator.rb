class UserDecorator < ApplicationDecorator
  delegate :username, :email

  def username_with_email
    "#{object.username} (#{object.email})"
  end
end
