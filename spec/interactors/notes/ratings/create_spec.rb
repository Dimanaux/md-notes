require "rails_helper"

describe Notes::Ratings::Create do
  let(:note) { create(:note, rating: 10, rating_count: 2) }
  let(:rate) { create(:rating, value: 2, note: note) }

  describe ".call" do
    before { described_class.call(rating: rate, user: create(:user)) }

    it "updates note's rating" do
      expect(note.rating).to eq(12)
    end

    it "updates note's rating count" do
      expect(note.rating_count).to eq(3)
    end
  end
end
