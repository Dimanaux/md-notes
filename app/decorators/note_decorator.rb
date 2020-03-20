class NoteDecorator < ApplicationDecorator
  delegate_all

  def author
    h.link_to object.user.username, object.user
  end

  def rating
    return 0 if object.rating_count.zero?
    (object.rating.to_f / object.rating_count).round
  end

  def already_rated_by?(user)
    object.ratings.exists?(user: user)
  end

  def rate_by(user)
    object.ratings.find_by(user: user)
  end
end
