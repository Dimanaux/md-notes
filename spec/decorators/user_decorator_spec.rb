require "rails_helper"

describe UserDecorator do
  let(:wrappee) { build(:user, email: "jon.lee@example.com", username: "lee.jon") }
  let(:user) { described_class.new(wrappee) }

  describe ".username_with_email" do
    subject { user.username_with_email }

    it { is_expected.to include("lee.jon") }

    it { is_expected.to include("jon.lee@example.com") }
  end
end
