module Notes
  module Ratings
    class Save
      include Interactor

      delegate :rating, to: :context

      def call
        rating.save
      end
    end
  end
end
