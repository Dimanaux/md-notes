require "rails_helper"

feature "Create Note" do
  include_context "current user signed in"

  scenario "User creates note" do
    visit new_user_note_path(current_user)

    fill_in "Title", with: "title 1"
    fill_in "Content", with: "content 1"

    click_button "Create Note"

    expect(page).to have_content("Note was successfully created")
    expect(page).to have_content("title 1")
    expect(page).to have_content("content 1")
  end
end
