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

  def notes_link
    h.link_to(notes_count_as_string, h.user_notes_path(object))
  end

  def notes_count_as_string
    "#{notes_count} #{I18n.t('active_record.models.note').pluralize(notes_count)}"
  end

  def info
    I18n.t(
      "users.info.html",
      username: username,
      notes_link: notes_link,
      rating: average_rating,
      note_path: h.user_notes_path(object)
    ).html_safe
  end
end
