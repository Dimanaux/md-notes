require "rails_helper"

feature "Search notes" do
  before do
    create(:note, title: "alpha beta", content: "gamma delta")
    create(:note, title: "beta epsilon", content: "theta delta")
    create(:note, title: "one two", content: "three four")
  end

  scenario "User searches notes by title" do
    visit notes_path

    fill_in :search_form_query, with: "beta"
    click_button "Search"

    expect(page).to have_content "alpha beta"
    expect(page).to have_content "gamma delta"

    expect(page).to have_content "beta epsilon"
    expect(page).to have_content "theta delta"

    expect(page).not_to have_content "one two"
    expect(page).not_to have_content "three four"
  end
end
