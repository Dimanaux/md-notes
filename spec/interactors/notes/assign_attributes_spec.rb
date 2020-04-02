require "rails_helper"

describe Notes::AssignAttributes do
  subject(:assign_attributes) do
    described_class.call(note: note, note_params: note_params)
  end

  let(:user) { create(:user) }
  let(:note) { create(:note, user: user) }
  let(:note_params) do
    { title: "note 0943", content: "no content" }
  end

  describe ".call" do
    it { is_expected.to be_a_success }

    context "when given no title" do
      let(:note_params) do
        { title: nil, content: "no content" }
      end

      it { is_expected.to be_a_failure }

      it "says what happened" do
        expect(assign_attributes.error).to include("Title can't be blank")
      end
    end
  end
end
