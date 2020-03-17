describe Notes::AssignAttributes do
  subject(:context) { described_class.call(note: note, note_params: params) }

  let(:user) { create(:user) }
  let(:note) { create(:note, user_id: user.id) }
  let(:params) { attributes_for(:note, user_id: user.id) }

  describe ".call" do
    context "when given valid params" do
      it { is_expected.to be_a_success }
    end

    context "when given no title" do
      before { params[:title] = "" }

      it { is_expected.to be_a_failure }
    end

    context "when given no content" do
      before { params[:content] = "" }

      it { is_expected.to be_a_failure }
    end

    context "when given title is taken" do
      before { create(:note, params) }

      it { is_expected.to be_a_failure }
    end
  end
end
