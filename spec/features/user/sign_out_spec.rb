require "rails_helper"

describe "Sign Out" do
  include_context "when user signed in"

  it "User signs out" do
    visit root_url
    click_link "Sign out"

    expect(page).to have_content("Sign in")
  end
end
