require "rails_helper"

describe Subscriptions::Destroy do
  describe ".call" do
    let(:user) { create(:user) }
    let(:follower) { create(:user) }

    before { Subscription.create(followee: user, follower: follower) }

    def call
      described_class.call(followee: user, follower: follower)
    end

    it "decreases followed user's followers count" do
      expect { call }.to change { user.followers.count }.by(-1)
    end

    it "decreses follower's subscriptions count" do
      expect { call }.to change { follower.subscriptions.count }.by(-1)
    end

    context "when unsubscribed" do
      before { call }

      it "user doesn't have the other as a follower" do
        expect(user.followers.map(&:follower)).not_to include(follower)
      end

      it "other user doesn't have the first one as a subscription" do
        expect(follower.subscriptions.map(&:followee)).not_to include(user)
      end
    end
  end
end
