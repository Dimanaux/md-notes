require "rails_helper"

describe UserDecorator do
  subject(:decorated) { user.decorate }

  let(:user) { create(:user, email: "jon.lee@example.com", username: "jon-lee") }

  describe ".username_with_email" do
    subject { decorated.username_with_email }

    it { is_expected.to include("jon-lee") }

    it { is_expected.to include("jon.lee@example.com") }
  end

  describe ".subscribed_to?" do
    subject { decorated.subscribed_to?(other_user) }

    let(:other_user) { create(:user) }

    context "when follower has subscription to user" do
      before { create(:subscription, followee: other_user, follower: user) }

      it { is_expected.to eq true }
    end

    context "when not a follower" do
      it { is_expected.to eq false }
    end

    context "when given a decorated user it works" do
      let(:other_user) { create(:user).decorate }

      it { is_expected.to eq false }
    end
  end

  describe ".subscription_for" do
    subject { decorated.subscription_for(other_user) }

    let(:other_user) { create(:user) }

    let(:subscription) { create(:subscription, followee: other_user, follower: user) }

    context "when present" do
      before { subscription }

      it { is_expected.to eq subscription }
    end

    context "when missing" do
      it { is_expected.to be_nil }
    end
  end
end
