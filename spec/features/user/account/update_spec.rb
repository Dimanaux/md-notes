require "rails_helper"

describe "Update Account" do
  include_context "when user signed in"

  before { current_user.reload }

  scenario "User updates account with valid data" do
    visit edit_user_registration_path
    fill_form(:user, :edit, username: "new_username")
    click_on "Update"

    expect(page).to have_content("new_username")
  end

  scenario "User enters not matched passwords" do
    visit edit_user_registration_path

    fill_form(:user, :edit, password: "qwerty", password_confirmation: "123123")
    click_on "Update"

    expect(page).to have_content("doesn't match Password")
  end
end
