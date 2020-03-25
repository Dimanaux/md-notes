module Notes
  module Ratings
    class AssignAttributes
      include Interactor

      delegate :rating, :rating_params, to: :context

      def call
        rating.assign_attributes(rating_params)
      end
    end
  end
end
