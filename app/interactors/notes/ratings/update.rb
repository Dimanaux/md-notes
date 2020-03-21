module Notes
  module Ratings
    class Update
      include Interactor

      delegate :rating, :old_rate, :old_rate=, to: :context

      after :update_note_rating

      def call
        self.old_rate = rating.value_was
        rating.save
      end

      private

      def update_note_rating
        note = rating.note
        note.rating += rating.value - old_rate
        note.save
      end
    end
  end
end