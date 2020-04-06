require "rails_helper"

describe Note, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :slug }
    it { is_expected.to validate_uniqueness_of(:slug).scoped_to(:author_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to :author }
  end
end
