require "rails_helper"

describe "users/notes", type: :routing do
  describe "public routes" do
    let(:author) { create(:user, username: "user-2") }
    let(:note) { create(:note, slug: "some-note", author: author) }

    scenario "#index" do
      visit notes_url(subdomain: author.username)

      expect(page).to have_current_url("user-2.lvh.me/notes")
    end

    scenario "#show" do
      visit note_url(note, subdomain: note.author.username)

      expect(page).to have_current_url("user-2.lvh.me/notes/some-note")
    end
  end

  describe "private routes" do
    include_context "when user signed in"

    let(:note) { create(:note, author: current_user, slug: "let-me-spec") }

    scenario "#new" do
      visit new_note_url(subdomain: current_user.username)

      expect(page).to have_current_url("#{current_user.username}.lvh.me/notes/new")
    end

    scenario "#edit" do
      visit edit_note_url(note, subdomain: note.author.username)

      expect(page).to have_current_url(
        "#{current_user.username}.lvh.me/notes/let-me-spec/edit"
      )
    end
  end
end
