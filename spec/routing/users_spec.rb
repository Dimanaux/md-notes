require "rails_helper"

describe "users", type: :routing do
  let(:user) { create(:user, username: "user-459") }

  scenario "#show" do
    visit user_root_url(subdomain: user.username)

    expect(page).to have_current_url("user-459.lvh.me")
  end
end
