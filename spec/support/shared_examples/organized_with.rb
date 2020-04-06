shared_examples "organized with" do |interactors|
  describe ".organized" do
    subject { described_class.organized }

    it { is_expected.to eq(interactors) }
  end
end
