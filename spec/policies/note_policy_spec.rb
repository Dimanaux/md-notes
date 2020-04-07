require 'rails_helper'

describe NotePolicy, type: :policy do
  let(:user) { build(:user) }
  let(:author) { build(:user) }
  let(:note) { build(:note, author: author) }

  subject { described_class }

  permissions ".scope" do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :show? do
    context "when authorized" do
      it { is_expected.to permit(user, note) }
    end

    context "when not authorized" do
      it { is_expected.to permit(nil, note) }
    end
  end

  permissions :create? do
    context "when not authorized" do
      it { is_expected.to permit(user, note) }
    end

    context "when not authorized" do
      it { is_expected.not_to permit(nil, note) }
    end
  end

  permissions :update? do
    context "when current user is author" do
      it { is_expected.to permit(author, note) }
    end

    context "when current user is not author" do
      it { is_expected.not_to permit(user, note) }
    end
  end

  permissions :destroy? do
    context "when current user is author" do
      it { is_expected.to permit(author, note) }
    end

    context "when current user is not author" do
      it { is_expected.not_to permit(user, note) }
    end
  end
end
