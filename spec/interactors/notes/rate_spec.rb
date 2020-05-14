require "rails_helper"

describe Notes::Rate do
  let(:note) { create(:note) }
  let(:rate) { build(:rating, note: note) }

  describe ".call" do
    before do
      described_class.call(rating: rate, rating_params: { value: 5 })
    end

    it "updates note's rating" do
      expect(note.average_rating).to eq(5)
    end
  end

  include_examples "organized with", [
    Notes::Ratings::Find,
    Notes::Ratings::Save,
    Notes::UpdateRating
  ]
end
