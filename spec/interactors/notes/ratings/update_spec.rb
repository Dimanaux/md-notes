require "rails_helper"

describe Notes::Ratings::Update do
  let(:note) { create(:note, rating: 10, rating_count: 2) }
  let(:rate) { create(:rating, value: 5, note: note) }

  describe ".call" do
    before do
      rate.value = 3
      described_class.call(rating: rate)
    end

    it "updates note's rating" do
      expect(note.rating).to eq(8)
    end

    it "keeps note's rating count the same" do
      expect(note.rating_count).to eq(2)
    end
  end
end
