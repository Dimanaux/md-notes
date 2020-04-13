require "rails_helper"

describe NotePolicy do
  let(:user) { build_stubbed(:user) }
  let(:record) { build_stubbed(:note, author: nil) }
  let(:context) { { user: user } }

  shared_context "when author" do
    let(:record) { build_stubbed(:note, author: user) }
  end

  describe_rule :update? do
    succeed "when current user is author" do
      include_context "when author"
    end

    failed "when current user is not author"
  end

  describe_rule :destroy? do
    succeed "when current user is author" do
      include_context "when author"
    end

    failed "when current user is not author"
  end
end
