require "rails_helper"

describe SubscriptionPolicy do
  let(:follower) { create(:user).decorate }
  let(:followee) { create(:user) }
  let(:record) { build(:subscription, follower: follower, followee: followee) }
  let(:context) { {user: follower} }

  shared_context "with subscription" do
    before { record.save }
  end
  shared_context "with no subscription" do
    before { record.destroy }
  end

  describe_rule :create? do
    succeed "when not subscribed" do
      include_context "with no subscription"
    end

    failed "when subscribed" do
      include_context "with subscription"
    end
  end

  describe_rule :destroy? do
    failed "when not subscribed" do
      include_context "with no subscription"
    end

    succeed "when subscribed" do
      include_context "with subscription"
    end
  end
end
