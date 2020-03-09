require "rails_helper"

feature "Update Note" do
  include_context "current user signed in"

  let(:note) { create(:note, user: current_user) }

  scenario "User creates note" do
    visit edit_user_note_path(current_user, note)

    fill_in :note_title, with: "#{note.title} updated"
    fill_in :note_content, with: "#{note.content} - said old content"

    click_button "Update Note"

    expect(page).to have_content("updated")
  end
end
