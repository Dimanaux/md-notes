require "rails_helper"

describe Notes::Ratings::Update do
  let(:note) { create(:note) }
  let(:first_rate) { build(:rating, value: 3, note: note) }
  let(:second_rate) { build(:rating, value: 5, note: note) }

  describe ".call" do
    # subject { described_class.call(rating: first_rate, first_rate.user) }

    it " " do
      described_class.call(rating: first_rate, user: create(:user))
      expect(note.rating).to eq(3.0)
    end

    it " " do
      described_class.call(rating: second_rate, user: create(:user))
      expect(note.rating).to eq(4.0)
    end
  end
end
