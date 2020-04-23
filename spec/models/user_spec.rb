require "rails_helper"

describe User do
  describe "validations" do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }

    it "validates username" do
      expect(build(:user, username: "user-1")).to be_valid
      expect(build(:user, username: "user 1")).to be_invalid
      expect(build(:user, username: "user-1 ")).to be_invalid
    end
  end

  describe "associations" do
    it { is_expected.to have_many :notes }
    it { is_expected.to have_many :followers }
    it { is_expected.to have_many :followees }
  end

  describe ".to_param" do
    subject { user.to_param }

    let(:user) { build(:user, username: "adams") }

    it { is_expected.to eq "adams" }
  end
end
