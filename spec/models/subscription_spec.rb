require "rails_helper"

describe Subscription do
  describe "associations" do
    it { is_expected.to belong_to :followee }
    it { is_expected.to belong_to :follower }
  end
end
