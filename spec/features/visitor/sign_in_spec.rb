require "rails_helper"

describe "Sign In" do
  let(:user) { create :user }
  let(:unconfirmed_user) { create :user, :not_confirmed }

  def sign_in(email, password)
    visit new_user_session_url

    fill_form(:user, email: email, password: password)
    click_button "Sign in"
  end

  it "Visitor signs in with valid credentials" do
    sign_in(user.email, user.password)

    expect(page).to have_content("Sign out")
  end

  it "Visitor signs in with invalid credentials" do
    sign_in(user.email, "wrong password")

    expect(page).to have_content("Sign in")
    expect(page).to have_content("Invalid Email or password")
  end

  it "Visitor signs in with unconfirmed email address" do
    sign_in(unconfirmed_user.email, user.password)

    expect(page).to have_content(
      "You have to confirm your email address before continuing."
    )
  end
end
