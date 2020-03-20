require "rails_helper"

describe Notes::Ratings::Destroy do
  let(:note) { create(:note, rating: 10, rating_count: 2) }
  let(:rate) { create(:rating, value: 5, note: note) }

  describe ".call" do
    before { described_class.call(rating: rate) }

    it "updates note's rating" do
      expect(note.rating).to eq(5)
    end

    it "updates note's rating count" do
      expect(note.rating_count).to eq(1)
    end
  end
end
