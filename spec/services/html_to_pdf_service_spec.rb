require "rails_helper"

RSpec.describe HtmlToPdfService do
  describe "::render" do
    subject(:result) { described_class.render("html content") }

    let(:fake_pdf_engine) { instance_double("WickedPdf", pdf_from_string: "pdf content") }

    before { allow(described_class).to receive(:pdf_engine).and_return(fake_pdf_engine) }

    it "invokes WickedPdf.pdf_from_string" do
      expect(fake_pdf_engine).to receive(:pdf_from_string).with("html content")
      expect(result).to eq "pdf content"
    end
  end
end
