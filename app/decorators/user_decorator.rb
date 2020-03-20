class UserDecorator < ApplicationDecorator
  delegate_all

  def username_with_email
    "#{object.username} (#{object.email})"
  end
end
