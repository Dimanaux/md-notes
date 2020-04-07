require "rails_helper"

describe SubscriptionPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  shared_context "with subscription" do
    let(:follower) { create(:user) }

    before do
      create(:subscription, follower: follower, followee: other_user)
    end
  end

  permissions ".scope" do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :create? do
    context "when not subscribed" do
      it { is_expected.to permit(user, other_user) }
    end

    context "when subscribed" do
      include_context "with subscription"

      it { is_expected.not_to permit(follower, other_user) }
    end
  end

  permissions :destroy? do
    context "when not subscribed" do
      it { is_expected.not_to permit(user, other_user) }
    end

    context "when subscribed" do
      include_context "with subscription"

      it { is_expected.to permit(follower, other_user) }
    end
  end
end
