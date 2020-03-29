require "rails_helper"

describe User do
  it { is_expected.to validate_presence_of :username }

  let(:user) { create(:user) }

  describe ".subscribed_to?" do
    context "when follower has subscription to user" do
      let(:follower) { create(:user, subscriptions: [user]) }

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

  describe ".followers" do
    let(:followers) { create_list(:user, 5) }

    before do
      followers.each { |follower| follower.subscriptions = [user] }
    end

    it "returns followers" do
      expect(user.followers).to match_array followers
    end
  end

  describe ".subscriptions" do
    let(:subscriptions) { create_list(:user, 5) }

    before { user.subscriptions = subscriptions }

    it "returns subscriptions" do
      expect(user.subscriptions).to match_array subscriptions
    end
  end
end
