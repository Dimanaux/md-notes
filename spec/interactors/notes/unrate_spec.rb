require "rails_helper"

describe Notes::Unrate do
  let(:note) { create(:note) }
  let(:rate) { create(:rating, value: 5, note: note) }

  before { create(:rating, value: 3, note: note) }

  describe ".call" do
    before { described_class.call(rating: rate) }

    it "updates note's rating" do
      expect(note.average_rating).to eq(3)
    end
  end
end
