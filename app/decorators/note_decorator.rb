class NoteDecorator < ApplicationDecorator
  delegate_all # :title, :content, :created_at, :slug, :to_param

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def author
    h.link_to object.user.username, object.user
  end

  def rating
    return 0 if object.rating_count == 0
    (object.rating.to_f / object.rating_count).round
  end

  def already_rated_by?(user)
    object.ratings.exists?(user: user)
  end

  def rate_by(user)
    object.ratings.find_by(user: user)
  end
end
