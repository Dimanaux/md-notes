require "rails_helper"

describe NoteDecorator do
  describe ".already_rated_by?" do
    let(:note) { create(:note).decorate }
    let(:user) { create(:user) }

    context "when rated by user" do
      before { create(:rating, note: note, user: user) }

      it "returns true" do
        expect(note.already_rated_by?(user)).to eq true
      end
    end

    context "when not rated" do
      it "return false" do
        expect(note.already_rated_by?(user)).to eq false
      end
    end
  end
end
