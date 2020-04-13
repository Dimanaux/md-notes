require "rails_helper"

describe "Authorization" do
  scenario "Guest visits private path" do
    note = create(:note)
    visit edit_user_note_path(note.author, note)

    expect(page).to have_current_path new_user_session_path
    expect(page).to have_content "You need to sign in or sign up before continuing"
  end
end
