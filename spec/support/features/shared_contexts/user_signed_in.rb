shared_context "when user signed in" do
  let(:current_user) { create :user }

  before { login_as current_user }
end
