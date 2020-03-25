require "rails_helper"

describe Notes::Create do
  let(:update_slug) { Notes::UpdateSlug.new }

  before { allow(Notes::UpdateSlug).to receive(:new).and_return(update_slug) }

  describe ".call" do
    let(:note) { build(:note) }

    it "delegates to AssignAttributes and UpdateSlug" do
      expect(update_slug).to receive(:call)
      described_class.call(note: note)
    end
  end
end
