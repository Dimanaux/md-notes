require "rails_helper"

describe Subscriptions::NotifySingle do
  describe ".call" do
    let(:fake) { double("Job") }

    before do
      allow(SubscriptionMailer).to receive(:note_notification_email).and_return(fake)
      allow(fake).to receive(:deliver_later)
    end

    it "sends email" do
      expect(SubscriptionMailer).to receive(:note_notification_email)
      expect(fake).to receive(:deliver_later)
      described_class.call
    end
  end
end
