require "rails_helper"

describe Note do
  describe "validations" do
    it { is_expected.to validate_presence_of :slug }
  end

  describe "associations" do
    it { is_expected.to belong_to :user }
  end
end
