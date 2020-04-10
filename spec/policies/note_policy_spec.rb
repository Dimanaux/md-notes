require "rails_helper"

describe NotePolicy do
  let(:user) { build_stubbed(:user) }
  let(:record) { build_stubbed(:note, author: nil) }
  let(:context) { {user: user} }

  describe_rule :index? do
    succeed "when user signed in"
    succeed "when user not signed in"
  end

  describe_rule :show? do
    succeed "when user signed in"
    succeed "when user not signed in"
  end

  describe_rule :update? do
    succeed "when current user is author" do
      let(:record) { build_stubbed(:note, author: user) }
    end

    failed "when current user is not author"
  end

  describe_rule :destroy? do
    succeed "when current user is author" do
      let(:record) { build_stubbed(:note, author: user) }
    end

    failed "when current user is not author"
  end
end
