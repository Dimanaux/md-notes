require "rails_helper"

describe Notes::UpdateSlug do
  let(:note) { create(:note, :unpublished, title: "Some new title", slug: "old-title") }

  describe ".call" do
    subject(:update_note) { described_class.call(note: note) }

    it { is_expected.to be_a_success }

    it "updates slug when title changed" do
      expect { update_note }.to change(note, :slug).to "some-new-title"
    end
  end

  context "when note is published" do
    let(:note) { create(:note, title: "Some new title", slug: "old-title") }

    it { is_expected.to be_a_success }

    it "doesn't change the slug" do
      expect { update_note }.not_to change(note, :slug)
    end
  end
end
