require "rails_helper"

describe "Sign Up" do
  let(:user_attributes) do
    attributes_for(:user).slice(:username, :email, :password, :password_confirmation)
  end
  let(:registered_user) { User.find_by(email: user_attributes[:email]) }

  it "Visitor signs up" do
    visit new_user_registration_url

    fill_form(:user, user_attributes)
    click_button "Sign up"

    open_email(registered_user.email)

    expect(current_email).to have_subject("Confirmation instructions")
    expect(current_email).to have_body_text(registered_user.username)

    visit_in_email("Confirm my account")

    expect(page).to have_content("Your email address has been successfully confirmed")
    expect(page).to have_text(registered_user.username)
  end
end
