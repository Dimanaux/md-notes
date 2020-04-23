class NoteDecorator < ApplicationDecorator
  delegate_all
  decorates_association :author

  def created_at
    object.created_at.strftime("%Y.%m.%d")
  end

  def preview
    object.content.lines.first
  end
end
