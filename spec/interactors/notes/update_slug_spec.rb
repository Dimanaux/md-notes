require "rails_helper"

describe Notes::UpdateSlug do
  let(:note) { create(:note) }

  describe ".call" do
    before { note.title = "Some new title" }

    it "updates slug when title changed" do
      expect { described_class.call(note: note) }
        .to change(note, :slug).to "some-new-title"
    end
  end
end
