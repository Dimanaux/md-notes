require "rails_helper"

describe Note do
  describe "validations" do
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :slug }
    it { is_expected.to validate_uniqueness_of(:slug).scoped_to(:user_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :ratings }
  end
end
