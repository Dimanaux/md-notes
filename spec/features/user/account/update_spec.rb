require "rails_helper"

describe "Update Account" do
  include_context "when user signed in"

  scenario "User updates account with valid data" do
    visit edit_user_registration_path
    fill_form(:user, :edit, username: "new-username")
    click_on "Update"

    expect(page).to have_content("new-username")
  end

  scenario "User enters not matched passwords" do
    visit edit_user_registration_path

    fill_form(:user, :edit, password: "qwerty", password_confirmation: "123123")
    click_on "Update"

    expect(page).to have_content("doesn't match Password")
  end
end
