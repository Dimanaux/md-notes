class UserDecorator < ApplicationDecorator
  delegate :username, :email

  def username_with_email
    "#{object.username} (#{object.email})"
  end

  def email_md5
    Digest::MD5.hexdigest(email)
  end
end
