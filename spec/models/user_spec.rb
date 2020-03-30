require "rails_helper"

describe User do
  it { is_expected.to validate_presence_of :username }

  let(:user) { create(:user) }

  describe ".subscribed_to?" do
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
