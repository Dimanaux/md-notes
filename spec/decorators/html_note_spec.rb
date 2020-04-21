require "rails_helper"

RSpec.describe HtmlNote do
  subject(:html_note) { described_class.new(note) }

  let(:note) { instance_double("Note", title: "Main note", content: "empty") }

  describe ".title" do
    subject { html_note.title }

    it { is_expected.to eq "<h1>Main note</h1>" }
  end

  describe ".content" do
    before { allow(Redcarpet::Markdown).to receive(:new).and_return(fake_md) }

    let(:fake_md) { instance_double("Redcarpet::Markdown") }

    it "passes html title and conent to the engine" do
      expect(fake_md).to receive(:render).with("empty")
      html_note.content
    end
  end
end
