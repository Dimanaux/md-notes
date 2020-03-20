require "rails_helper"

describe NoteDecorator do
  subject(:note) { wrappee.decorate }

  describe ".rating" do
    let(:wrappee) { build(:note, rating: 0, rating_count: 0) }

    context "when there are no rates" do
      it "returns 0" do
        expect(note.rating).to eq(0)
      end
    end

    context "when one rate" do
      let(:wrappee) { build(:note, rating: 4, rating_count: 1) }

      it "returns it" do
        expect(note.rating).to eq(4)
      end
    end

    context "when many rates" do
      let(:wrappee) { build(:note, rating: 17, rating_count: 5) }

      it "returns the average" do
        expect(note.rating).to eq(3)
      end
    end
  end
end
