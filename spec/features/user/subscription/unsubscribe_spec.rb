require "rails_helper"

feature "Subscribe" do
  include_context "when user signed in"

  let(:user) { create(:user) }

  before { create(:subscription, follower: current_user, followee: user) }

  scenario "User subscribes to another user" do
    visit user_url(subdomain: user.username)

    expect(page).to have_button("Unsubscribe")

    click_button "Unsubscribe"

    expect(page).to have_content("Subscription was successfully destroyed")
  end
end
