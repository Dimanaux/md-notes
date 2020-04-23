require "rails_helper"

RSpec.describe PdfNote do
  subject(:pdf_note) { described_class.new(note) }

  let(:author) { instance_double("User", username: "arthur") }
  let(:note_attributes) do
    { slug: "topic-memories", author: author,
      title: "Topic Memories;", content: "blank" }
  end
  let(:note) { instance_double("Note", note_attributes) }

  describe ".filename" do
    subject { pdf_note.filename }

    it { is_expected.to eq "arthur-topic-memories.pdf" }
  end

  describe ".content" do
    subject(:result) { pdf_note.content }

    before { allow(HtmlToPdfService).to receive(:render).and_return("pdf") }

    it "passes html title and conent to the engine" do
      expect(HtmlToPdfService).to receive(:render).with("Topic Memories;blank")
      expect(result).to eq "pdf"
    end
  end
end
