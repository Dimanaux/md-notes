require "rails_helper"

describe Subscriptions::Create do
  describe ".call" do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    def call
      described_class.call(followee: user, follower: other_user)
    end

    it "increases followed user's followers count" do
      expect { call }.to change { user.followers.count }.by(1)
    end

    it "increases follower's subscriptions count" do
      expect { call }.to change { other_user.subscriptions.count }.by(1)
    end

    context "when subscription exists" do
      before { call }

      it "user has other one as a follower" do
        expect(user.followers).to include(other_user)
      end

      it "other user has user as a subscription" do
        expect(other_user.subscriptions).to include(user)
      end
    end
  end
end
