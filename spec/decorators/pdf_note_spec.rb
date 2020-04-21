require "rails_helper"

RSpec.describe PdfNote do
  subject(:pdf_note) { described_class.new(note) }

  let(:author) { instance_double("User", username: "arthur") }
  let(:note_attributes) do
    {
      slug: "topic-memories", author: author,
      title: "Topic Memories;", content: "blank"
    }
  end
  let(:note) { instance_double("Note", note_attributes) }

  describe ".filename" do
    subject { pdf_note.filename }

    it { is_expected.to eq "arthur-topic-memories.pdf" }
  end

  describe ".content" do
    before { allow(described_class).to receive(:pdf_engine).and_return(fake_pdf_engine) }

    let(:fake_pdf_engine) { instance_double("WickedPdf") }

    it "passes html title and conent to the engine" do
      expect(fake_pdf_engine).to receive(:pdf_from_string).with("Topic Memories;blank")
      pdf_note.content
    end
  end
end
