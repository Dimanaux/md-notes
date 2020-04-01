require "rails_helper"

describe SubscriptionMailer do
  describe ".note_notification_email" do
    subject(:mail) { described_class.note_notification_email(note: note, follower: follower) }

    let(:author) { build(:user) }
    let(:note) { build(:note, user: author) }
    let(:follower) { build(:user, followees: [author]) }

    it "sets the subject" do
      expect(mail.subject).to eql("md_notes notifications")
    end

    it "sends email to follower" do
      expect(mail.to).to eq [follower.email]
    end
  end
end
