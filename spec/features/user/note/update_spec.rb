require "rails_helper"

feature "Update Note" do
  include_context "when user signed in"

  let(:note) { create(:note, author: current_user) }

  scenario "User creates note" do
    visit edit_note_url(note, subdomain: note.author.username)

    fill_in :note_title, with: "My updated title"
    fill_in :note_content, with: "#{note.content} - said old content"

    click_button "Update Note"

    expect(page).to have_content("Note was successfully updated")
    expect(page).to have_content("My updated title")
  end
end
