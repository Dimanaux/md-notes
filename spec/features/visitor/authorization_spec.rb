require "rails_helper"

describe "Authorization" do
  let(:note) { create(:note) }

  scenario "Guest visits private path" do
    visit edit_note_url(note, subdomain: note.author.username)

    expect(page).to have_current_path new_user_session_path
    expect(page).to have_content "You need to sign in or sign up before continuing"
  end
end
