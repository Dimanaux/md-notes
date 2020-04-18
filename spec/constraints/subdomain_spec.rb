require "rails_helper"

describe Subdomain do
  describe ".matches?" do
    subject { described_class.matches?(request) }

    let(:request) { instance_double(ActionDispatch::Request, subdomain: subdomain) }

    context "with no subdomain" do
      let(:subdomain) { "" }

      it { is_expected.to eq false }
    end

    context "with subdomain" do
      let(:subdomain) { "user-2" }

      it { is_expected.to eq true }
    end

    context "with reserved subdomain" do
      let(:subdomain) { "api" }

      it { is_expected.to eq false }
    end
  end
end
