require "rails_helper"

describe "users/notes", type: :routing do
  scenario "#index" do
    visit notes_url

    expect(page).to have_current_url("lvh.me/notes")
  end
end
