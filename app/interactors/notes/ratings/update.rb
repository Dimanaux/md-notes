module Notes
  module Ratings
    class Update
      include Interactor

      delegate :rating, :rating_params, to: :context

      after :update_note_rating

      def call
        rating.user = context.user
        rating.save
      end

      private

      def update_note_rating
        note = rating.note
        ratings_count = note.ratings.count
        note.rating = (note.rating * ratings_count + rating.value) / ratings_count
        note.save
      end
    end
  end
end
