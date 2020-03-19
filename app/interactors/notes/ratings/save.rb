module Notes
  module Ratings
    class Save
      include Interactor

      delegate :rating, :rating_params, to: :context

      def call
        rating.user = context.user
        rating.save
      end
    end
  end
end
