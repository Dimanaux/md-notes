require "rails_helper"

describe NotesHelper, type: :helper do
  include_context "when using domain", "test.local"

  let(:user) { instance_double("User", username: "steve") }
  let(:note) { instance_double("Note", author: user, to_param: "apple") }

  describe ".all_notes_url" do
    subject { all_notes_url }

    it { is_expected.to url_eq "test.host/notes" }
  end

  describe ".new_user_note_url" do
    subject { new_user_note_url(user) }

    it { is_expected.to url_eq "steve.test.host/notes/new" }
  end

  describe ".user_notes_url" do
    subject { user_notes_url(user) }

    it { is_expected.to url_eq "steve.test.host/notes" }
  end

  describe ".user_note_url" do
    subject { user_note_url(note) }

    it { is_expected.to url_eq "steve.test.host/notes/apple" }
  end

  describe ".edit_user_note_url" do
    subject { edit_user_note_url(note) }

    it { is_expected.to url_eq "steve.test.host/notes/apple/edit" }
  end
end
