shared_context "when user signed in" do
  let(:current_user) { create(:user) }

  before do
    visit new_user_session_url
    fill_in "Enter your email address", with: current_user.email
    fill_in "Enter your password", with: current_user.password
    click_button "Sign in"
  end
end
