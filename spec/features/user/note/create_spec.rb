require "rails_helper"

feature "Create Note" do
  include_context "current user signed in"

  let(:note) { create(:note, user: current_user) }

  scenario "User creates note" do
    visit new_user_note_path(current_user)

    fill_in "Title", with: "title 1"
    fill_in "Content", with: "content 1"

    click_button "Create Note"

    expect(page).to have_content("Note was successfully created")
    expect(page).to have_content("title 1")
    expect(page).to have_content("content 1")
  end

  scenario "User creates note but slug taken" do
    visit new_user_note_path(current_user)

    fill_in "Title", with: note.title
    fill_in "Content", with: "content 2"

    click_button "Create Note"

    expect(page).to have_content("You already have a note with similar title")
  end
end
