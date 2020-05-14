module Notes
  module Ratings
    class Destroy
      include Interactor

      delegate :rating, to: :context

      def call
        rating.destroy
      end
    end
  end
end
