require "rails_helper"

feature "Download note" do
  let(:note) { create(:note) }

  scenario "download" do
    visit user_note_url(note.author, note)

    expect(page).to have_link "Export as PDF"

    click_on "Export as PDF"

    expect(page.response_headers["Content-Type"]).to include "pdf"
  end
end
