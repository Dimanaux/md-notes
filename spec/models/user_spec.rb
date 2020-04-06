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
  end
end
