require "rails_helper"

feature "Create Note" do
  include_context "current user signed in"

  scenario "User creates note" do
    visit new_note_path

    fill_in :note_title, with: "title 1"
    fill_in :note_content, with: "content 1"

    click_button "Create Note"

    expect(page).to have_content("created")
  end
end
