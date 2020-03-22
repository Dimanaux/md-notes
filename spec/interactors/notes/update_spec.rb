require "rails_helper"

describe Notes::Update do
  let(:assign_attributes) { Notes::AssignAttributes.new }
  let(:update_slug) { Notes::UpdateSlug.new }

  before do
    allow(Notes::AssignAttributes).to receive(:new).and_return(assign_attributes)
    allow(Notes::UpdateSlug).to receive(:new).and_return(update_slug)
  end

  describe ".call" do
    let(:note) { build(:note) }

    it "delegates to AssignAttributes and UpdateSlug" do
      expect(assign_attributes).to receive(:call)
      expect(update_slug).to receive(:call)
      described_class.call(note: note, note_params: {})
    end
  end
end
