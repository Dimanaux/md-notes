require "rails_helper"

describe NoteDecorator do
  subject(:decorated) { note.decorate }

  describe ".already_rated_by?" do
    let(:note) { create(:note) }
    let(:user) { create(:user) }

    context "when rated by user" do
      before { create(:rating, note: note, user: user) }

      it "returns true" do
        expect(decorated.already_rated_by?(user)).to eq true
      end
    end

    context "when not rated" do
      it "return false" do
        expect(decorated.already_rated_by?(user)).to eq false
      end
    end
  end

  describe ".created_at" do
    let(:note) { build(:note, created_at: Date.new(1970, 1, 1)) }

    it "formats date" do
      expect(decorated.created_at).to eq("1970.01.01")
    end
  end
end
