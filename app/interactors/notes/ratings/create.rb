module Notes
  module Ratings
    class Create
      include Interactor

      delegate :rating, to: :context

      after :update_note_rating

      def call
        rating.user = context.user
        rating.save
      end

      private

      def update_note_rating
        note = rating.note
        note.rating += rating.value
        note.rating_count += 1
        note.save
      end
    end
  end
end
