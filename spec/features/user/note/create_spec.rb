require "rails_helper"

feature "Create Note" do
  include_context "when user signed in"

  let(:note) { create(:note, author: current_user) }

  scenario "User creates note" do
    visit new_note_url(subdomain: current_user.username)

    fill_in "Title", with: "title 1"
    fill_in "Content", with: "content 1"

    click_button "Create note"

    expect(page).to have_content("Note was successfully created")
    expect(page).to have_content("title 1")
    expect(page).to have_content("content 1")
  end

  scenario "User creates note but slug taken" do
    visit new_note_url(subdomain: current_user.username)

    fill_in "Title", with: note.title
    fill_in "Content", with: "content 2"

    click_button "Create note"

    # TODO: find out why error messages are not being shown
    expect(page).to have_content("already been taken")
  end
end
