require "rails_helper"

describe FilteredNotesQuery do
  subject(:query) { described_class.new(Note, params) }

  let!(:first_note) { create :note, title: "One", content: "Two" }
  let!(:second_note) { create :note, title: "Two", content: "One" }
  let!(:third_note) { create :note, title: "Three", content: "Three" }

  describe ".all" do
    subject { query.all }

    let(:params) { { query: "one" } }

    it { is_expected.to include(first_note, second_note) }

    it { is_expected.not_to include(third_note) }
  end
end
