require "rails_helper"

describe UsersHelper, type: :helper do
  include_context "when using domain", "test.local"

  describe ".user_profile_url" do
    subject { user_profile_url(user) }

    let(:user) { instance_double("User", username: "cyborg") }

    it { is_expected.to url_eq "cyborg.test.host" }
  end

  describe ".edit_registration_url" do
    subject { edit_registration_url }

    it { is_expected.to url_eq "test.host/users/edit" }
  end
end
