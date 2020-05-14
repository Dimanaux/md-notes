module Notes
  module Ratings
    class Find
      include Interactor

      delegate :rating, to: :context

      def call
        found = Rating.find_by(user: rating.user, note: rating.note)
        return unless found

        found.value = rating.value
        context.rating = found
      end
    end
  end
end
