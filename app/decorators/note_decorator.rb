class NoteDecorator < ApplicationDecorator
  delegate_all

  def already_rated_by?(user)
    object.ratings.exists?(user: user)
  end

  def rating_by(user)
    object.ratings.find_by(user: user)
  end

  def created_at
    object.created_at.strftime("%Y.%m.%d")
  end
end
