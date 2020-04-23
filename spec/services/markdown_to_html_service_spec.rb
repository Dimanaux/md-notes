require "rails_helper"

RSpec.describe MarkdownToHtmlService do
  describe "::render" do
    subject(:result) { described_class.render("empty") }

    let(:fake_md) { instance_double("Redcarpet::Markdown", render: "rendered") }

    before { allow(described_class).to receive(:markdown_engine).and_return(fake_md) }

    it "invokes Redcarpet::Markdown" do
      expect(fake_md).to receive(:render).with("empty")
      expect(result).to eq "rendered"
    end
  end
end
