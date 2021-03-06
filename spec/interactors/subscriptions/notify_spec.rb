require "rails_helper"

describe Subscriptions::Notify do
  describe ".call" do
    subject(:notify) { described_class.call(note: note) }

    let(:user) { create(:user) }
    let(:note) { create(:note, author: user) }
    let(:follower) { create(:user) }
    let(:fake_delivery) { instance_double("ActionMailer::MessageDelivery") }

    before do
      create(:subscription, followee: user, follower: follower)
      allow(SubscriptionMailer).to(
        receive(:note_notification_email).and_return(fake_delivery)
      )
    end

    it "sends emails to followers" do
      expect(SubscriptionMailer).to(
        receive(:note_notification_email)
          .with(note: note, follower: follower)
      )
      expect(fake_delivery).to receive(:deliver_later)
      notify
    end
  end
end
