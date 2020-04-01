require "rails_helper"

describe Subscriptions::Notify do
  describe ".call" do
    let(:user) { create(:user) }
    let(:note) { create(:note, user: user) }
    let(:followers) { create_list(:user, 3) }
    let(:fake_delivery) do
      instance_double("ActionMailer::MessageDelivery")
    end

    before do
      followers.each do |follower|
        Subscriptions::Create.call(followee: user, follower: follower)
      end
      allow(SubscriptionMailer).to(
        receive(:note_notification_email).and_return(fake_delivery)
      )
      allow(fake_delivery).to receive(:deliver_later)
    end

    it "sends emails to followers" do
      followers.each do |follower|
        expect(SubscriptionMailer).to(
          receive(:note_notification_email)
            .with(note: note, follower: follower)
        )
      end
      expect(fake_delivery).to receive(:deliver_later)
      described_class.call(note: note)
    end
  end
end
