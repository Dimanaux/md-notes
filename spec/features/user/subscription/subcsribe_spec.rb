require "rails_helper"

feature "Subscribe" do
  include_context "when user signed in"

  let(:user) { create(:user) }

  scenario "User subscribes to another user" do
    visit user_path(user)

    expect(page).to have_button("Subscribe")

    click_button "Subscribe"

    expect(page).to have_content("Subscription was successfully created")
  end
end
