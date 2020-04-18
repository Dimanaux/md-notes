module NotesHelper
  def all_notes_url
    notes_url(subdomain: '')
  end

  def new_user_note_url(user)
    new_note_url(subdomain: user.username)
  end

  def user_notes_url(user)
    notes_url(subdomain: user.username)
  end

  def user_note_url(note)
    note_url(note, subdomain: note.author.username)
  end

  def edit_user_note_url(note)
    edit_note_url(note, subdomain: note.author.username)
  end
end
