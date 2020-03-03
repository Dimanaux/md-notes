class NoteDecorator < ApplicationDecorator
  delegate_all

  def author_link(text = user.username)
    h.link_to text, user
  end
end
