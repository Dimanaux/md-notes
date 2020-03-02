module NotesHelper
  def note_url(note)
    user_note_url(note.user, slug: note.slug)
  end

  alias_method :note_path, :note_url

  def edit_note_path(note)
    edit_user_note_path(note.user, note)
  end
end
