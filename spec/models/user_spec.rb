require "rails_helper"

describe User do
  it { is_expected.to validate_presence_of :username }

  describe "subscriptions" do
    let(:user) { create(:user) }

    describe ".subscribe_to" do
      let(:other_user) { create(:user) }

      it "increases followed user's followers count" do
        expect { other_user.subscribe_to(user) }
          .to change { user.followers.count }.by(1)
      end

      it "increses follower's subscriptions count" do
        expect { other_user.subscribe_to(user) }
          .to change { other_user.subscriptions.count }.by(1)
      end

      context "when subscription exists" do
        before { other_user.subscribe_to(user) }

        it "user has other one as a follower" do
          expect(user.followers).to include(other_user)
        end

        it "other user has user as a subscription" do
          expect(other_user.subscriptions).to include(user)
        end
      end
    end

    describe ".unsubscribe_from" do
      let(:other_user) { create(:user) }

      before do
        other_user.subscriptions = [user]
      end

      it "decreases followed user's followers count" do
        expect { other_user.unsubscribe_from(user) }
          .to change { user.followers.count }.by(-1)
      end

      it "decreses follower's subscriptions count" do
        expect { other_user.unsubscribe_from(user) }
          .to change { other_user.subscriptions.count }.by(-1)
      end

      context "when unsubscribed" do
        before { other_user.unsubscribe_from(user) }

        it "user has no other as a follower" do
          expect(user.followers).not_to include(other_user)
        end

        it "other user has no user as a subscription" do
          expect(other_user.subscriptions).not_to include(user)
        end
      end
    end

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
        followers.each { |follower| follower.subscribe_to(user) }
      end

      it "returns followers" do
        expect(user.followers).to match_array followers
      end
    end

    describe ".subscriptions" do
      let(:subscriptions) { create_list(:user, 5) }

      before do
        subscriptions.each { |subscription| user.subscribe_to(subscription) }
      end

      it "returns subscriptions" do
        expect(user.subscriptions).to match_array subscriptions
      end
    end
  end
end
