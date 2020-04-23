require "rails_helper"

RSpec.describe NoteDecorator do
  let(:note) { described_class.new(wrappee) }
  let(:wrappee) { build(:note, content: "Multi\nline\ncontent\n", created_at: Date.new(1970, 1, 1)) }

  describe ".created_at" do
    subject { note.created_at }

    it { is_expected.to eq "1970.01.01" }
  end

  describe ".preview" do
    subject { note.preview }

    it { is_expected.to eq "Multi\n" }
  end
end
