require "rails_helper"

feature "Destroy Note" do
  include_context "when user signed in"

  let(:note) { create(:note, author: current_user) }

  scenario "User destroys note" do
    visit note_url(note, subdomain: note.author.username)

    click_link "Destroy"

    expect(page).to have_content("Note was successfully destroyed")
  end
end
