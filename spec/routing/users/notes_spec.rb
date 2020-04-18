require "rails_helper"

describe "users/notes", type: :routing do
  include_context "when using domain", "test.local"

  describe "public routes" do
    let(:author) { create(:user, username: "user-2") }
    let(:note) { create(:note, slug: "some-note", author: author) }

    scenario "#index" do
      visit user_notes_url(author)

      expect(page).to have_current_url("user-2.test.local/notes")
    end

    scenario "#show" do
      visit user_note_url(note)

      expect(page).to have_current_url("user-2.test.local/notes/some-note")
    end
  end

  describe "private routes" do
    include_context "when user signed in"

    let(:note) { create(:note, author: current_user, slug: "let-me-spec") }

    scenario "#new" do
      visit new_user_note_url(current_user)

      expect(page).to have_current_url("#{current_user.username}.test.local/notes/new")
    end

    scenario "#edit" do
      visit edit_user_note_url(note)

      expect(page).to have_current_url(
        "#{current_user.username}.test.local/notes/let-me-spec/edit"
      )
    end
  end
end
