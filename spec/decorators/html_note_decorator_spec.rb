require "rails_helper"

RSpec.describe HtmlNoteDecorator do
  subject(:html_note) { described_class.new(note) }

  let(:note) { instance_double("Note", title: "Main note", content: "empty") }

  describe ".title" do
    subject { html_note.title }

    it { is_expected.to eq "<h1>Main note</h1>" }
  end

  describe ".content" do
    subject(:html_content) { html_note.content }

    before { allow(MarkdownToHtmlService).to receive(:render).and_return("html") }

    it "passes markdown body to the service" do
      expect(MarkdownToHtmlService).to receive(:render).with("empty")
      expect(html_content).to eq "html"
    end
  end
end
