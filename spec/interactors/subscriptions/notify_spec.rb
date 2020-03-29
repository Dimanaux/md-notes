require "rails_helper"

describe Subscriptions::Notify do
  describe ".call" do
    let(:user) { create(:user) }
    let(:note) { create(:note, user: user) }
    let(:followers) { create_list(:user, 3) }

    before do
      followers.each do |follower|
        Subscriptions::Create.call(followee: user, follower: follower)
      end
      allow(Subscriptions::NotifySingle).to receive(:call)
    end

    it "sends emails to followers" do
      followers.each do |follower|
        expect(Subscriptions::NotifySingle).to(
          receive(:call).with(note: note, follower: follower)
        )
      end
      described_class.call(note: note)
    end
  end
end
