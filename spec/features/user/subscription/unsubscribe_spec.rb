require "rails_helper"

feature "Subscribe" do
  include_context "when user signed in"

  let(:user) { create(:user) }

  before { create(:subscription, follower: current_user, followee: user) }

  scenario "User subscribes to another user" do
    visit user_path(user)

    expect(page).to have_link("Unsubscribe")

    click_link "Unsubscribe"

    expect(page).to have_content("Subscription was successfully destroyed")
  end
end
