require "rails_helper"

describe "Cancel Account" do
  include_context "when user signed in"

  scenario "User cancels account" do
    visit edit_user_registration_path
    click_link "Cancel my account"

    expect(page).to have_content("Sign in")
    expect(page).to have_content(
      "Bye! Your account has been successfully cancelled. We hope to see you again soon."
    )

    click_link "Sign in"
    fill_form(:user, current_user.attributes.slice(:email, :password))
    click_button "Sign in"

    expect(page).to have_content("Invalid Email or password.")
  end
end
