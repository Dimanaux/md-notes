require "rails_helper"

RSpec.describe RatingPolicy do
  let(:current_user) { build_stubbed(:user) }
  let(:record) { build_stubbed(:rating, user: nil) }
  let(:context) { { user: current_user } }

  shared_context "when rated by current user" do
    let(:record) { build_stubbed(:rating, context) }
  end

  describe_rule :create? do
    succeed "when logged in"
  end

  describe_rule :update? do
    succeed "when rated by current user" do
      include_context "when rated by current user"
    end

    failed "when rated not by current user"
  end

  describe_rule :destroy? do
    succeed "when rated by current user" do
      include_context "when rated by current user"
    end

    failed "when rated not by current user"
  end
end
