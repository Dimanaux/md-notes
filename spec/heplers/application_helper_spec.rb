require "rails_helper"

describe ApplicationHelper, type: :helper do
  include_context "when using domain", "test.local"

  describe ".application_root_url" do
    subject { application_root_url }

    it { is_expected.to url_eq "test.host" }
  end

  describe ".destroy_session_url" do
    subject { destroy_session_url }

    it { is_expected.to url_eq "test.host/users/sign_out" }
  end

  describe ".new_session_url" do
    subject { new_session_url }

    it { is_expected.to url_eq "test.host/users/sign_in" }
  end

  describe ".new_registration_url" do
    subject { new_registration_url }

    it { is_expected.to url_eq "test.host/users/sign_up" }
  end
end
