module NotesHelper
  def note_url(note)
    user_note_url(note.user, note)
  end

  def note_path(note)
    note_url(note)
  end

  def edit_note_path(note)
    edit_user_note_path(note.user, note)
  end
end
