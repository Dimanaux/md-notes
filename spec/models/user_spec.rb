require "rails_helper"

describe User do
  describe "validations" do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }

    it "validates username" do
      expect(build(:user, username: "user-1")).to be_valid
      expect(build(:user, username: "user 1")).to be_invalid
      expect(build(:user, username: "user-1 ")).to be_invalid
    end
  end

  describe "associations" do
    it { is_expected.to have_many :notes }
    it { is_expected.to have_many :followers }
    it { is_expected.to have_many :followees }
  end

  describe ".subscribed_to?" do
    let(:user) { create(:user) }

    context "when follower has subscription to user" do
      let(:follower) { create(:user) }

      before { create(:subscription, followee: user, follower: follower) }

      it "returns true" do
        expect(follower.subscribed_to?(user)).to be true
      end
    end

    context "when not a follower" do
      let(:not_follower) { create(:user) }

      it "returns false" do
        expect(not_follower.subscribed_to?(user)).to be false
      end
    end
  end
end
