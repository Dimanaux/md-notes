require "rails_helper"

describe SubscriptionPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:followee) { create(:user) }
  let(:subscription) { build(:subscription, follower: user, followee: followee) }

  shared_context "with subscription" do
    before do
      subscription.save
    end
  end

  permissions ".scope" do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :create? do
    context "when not subscribed" do
      it { is_expected.to permit(user, subscription) }
    end

    context "when subscribed" do
      include_context "with subscription"

      it { is_expected.not_to permit(user, subscription) }
    end
  end

  permissions :destroy? do
    context "when not subscribed" do
      it { is_expected.not_to permit(user, subscription) }
    end

    context "when subscribed" do
      include_context "with subscription"

      it { is_expected.to permit(user, subscription) }
    end
  end
end
