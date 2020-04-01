require "rails_helper"

describe User do
  describe "validations" do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }
  end

  describe "associations" do
    it { is_expected.to have_many :notes }
    it { is_expected.to have_many :ratings }
  end
end
