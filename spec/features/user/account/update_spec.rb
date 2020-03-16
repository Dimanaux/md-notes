require "rails_helper"

feature "Update Account" do
  include_context "current user signed in"

  scenario "User updates account with valid data" do
    visit edit_user_registration_path(current_user)
    fill_form(:user, :edit, username: "New Name")
    click_on "Update"

    expect(page).to have_content("New Name")
  end

  scenario "User enters not matched passwords" do
    visit edit_user_registration_path(current_user)

    fill_form(:user, :edit, password: "qwerty", password_confirmation: "123123")
    click_on "Update"

    expect(page).to have_content("doesn't match Password")
  end
end
