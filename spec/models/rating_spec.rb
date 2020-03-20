require 'rails_helper'

describe Rating do
  describe "associations" do
    it { is_expected.to belong_to :note }
    it { is_expected.to belong_to :user }
  end
end
