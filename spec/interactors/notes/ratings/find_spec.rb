require "rails_helper"

describe Notes::Ratings::Find do
  subject(:found) { described_class.call(rating: rating) }

  let(:note) { create(:note) }
  let(:user) { create(:user) }
  let(:rating) { build(:rating, note: note, user: user, value: 4) }

  context "when note not rated by the user yet" do
    it "succeeds" do
      expect(found).to be_a_success
    end

    it "does nothing" do
      expect(found.rating.value).to eq 4
      expect(found.rating).not_to be_persisted
    end
  end

  context "when note already rated by the user" do
    before { create(:rating, note: note, user: user, value: 5) }

    it "succeeds" do
      expect(found).to be_a_success
    end

    it "keeps assigned rating" do
      expect(found.rating.value).to eq 4
    end

    it "reloads rating" do
      expect(found.rating).to be_persisted
    end
  end
end
