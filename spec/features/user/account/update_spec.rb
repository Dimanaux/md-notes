require "rails_helper"

describe "Update Account" do
  include_context "when user signed in"

  before do
    visit edit_user_registration_path
  end

  it "User updates account with valid data" do
    fill_form(:user, :edit, username: "New Name")
    click_on "Update"

    expect(page).to have_content("New Name")
  end

  it "User enters not matched passwords" do
    fill_form(:user, :edit, password: "qwerty", password_confirmation: "123123")
    click_on "Update"

    expect(page).to have_content("doesn't match Password")
  end
end
