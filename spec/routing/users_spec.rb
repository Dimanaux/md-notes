require "rails_helper"

describe "users", type: :routing do
  include_context "when using domain", "test.local"

  let(:user) { create(:user, username: "user-459") }

  scenario "#show" do
    visit user_profile_url(user)

    expect(page).to have_current_url("user-459.test.local")
  end
end
