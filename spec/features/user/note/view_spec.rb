require "rails_helper"

feature "View Note" do
  let(:note) { create(:note, title: "Some note #45", content: "Hello from UK...") }

  scenario "User views note" do
    visit note_url(note, subdomain: note.author.username)

    expect(page).to have_content("Some note #45")
    expect(page).to have_content("Hello from UK...")
  end
end
