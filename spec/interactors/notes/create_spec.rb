require "rails_helper"

describe Notes::Create do
  describe ".organized" do
    subject { described_class.organized }

    let(:expected_interactors) do
      [
        Notes::UpdateSlug
      ]
    end

    it { is_expected.to eq(expected_interactors) }
  end
end
