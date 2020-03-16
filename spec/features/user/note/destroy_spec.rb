require "rails_helper"

feature "Destroy Note" do
  include_context "current user signed in"

  let(:note) { create(:note, user: current_user) }

  scenario "User destroys note" do
    visit user_note_path(current_user, note)

    click_button "Destroy"

    expect(page).to have_content("Note was successfully destroyed")
  end
end
