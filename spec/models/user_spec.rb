require "rails_helper"

describe User do
  describe "validations" do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }
  end
end
