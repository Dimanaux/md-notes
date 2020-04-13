require "rails_helper"

describe FilteredNotesQuery do
  subject(:query) { described_class.new(Note, params) }

  def note(title, content)
    create(:note, title: title, content: content)
  end

  describe ".all" do
    subject { query.all }

    let(:params) { { query: "one" } }
    let!(:notes) do
      {
        one: note("one", "two"),
        two: note("two", "one"),
        three: note("three", "three")
      }
    end

    it { is_expected.to include(notes[:one], notes[:two]) }

    it { is_expected.not_to include(notes[:three]) }
  end
end
