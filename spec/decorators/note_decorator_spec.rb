require "rails_helper"

describe NoteDecorator do
  subject(:decorated) { note.decorate }

  describe ".created_at" do
    let(:note) { build(:note, created_at: Date.new(1970, 1, 1)) }

    it "formats date" do
      expect(decorated.created_at).to eq("1970.01.01")
    end
  end
end
