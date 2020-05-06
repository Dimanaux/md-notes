require "rails_helper"

describe "users/notes", type: :routing do
  include_context "when using domain", "test.local"

  scenario "#index" do
    visit notes_url(subdomain: "")

    expect(page).to have_current_url("test.local/notes")
  end
end
