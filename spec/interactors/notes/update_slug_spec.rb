require "rails_helper"

describe Notes::UpdateSlug do
  let(:note) { create(:note, title: "Some new title", slug: "old-title") }

  describe ".call" do
    subject(:update_slug) { described_class.call(note: note) }

    it { is_expected.to be_a_success }

    it "updates slug when title changed" do
      expect { update_slug }.to change(note, :slug).to "some-new-title"
    end
  end
end
