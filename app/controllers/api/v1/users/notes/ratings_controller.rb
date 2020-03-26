module Api
  module V1
    module Users
      module Notes
        class RatingsController < Api::V1::ApplicationController
          expose :user, find_by: :username
          expose :note, find_by: :slug, parent: :user
          expose :ratings, from: :note
          expose :rating, parent: :note

          def create
            ::Notes::Rate.call(
              rating: rating, rating_params: { user: current_user }
            )

            respond_with user, note, rating
          end

          def update
            ::Notes::Rate.call(
              rating: rating, rating_params: rating_params
            )

            respond_with rating
          end

          def destroy
            ::Notes::Unrate.call(rating: rating)

            respond_with user, note, rating
          end

          private

          def rating_params
            params.require(:rating).permit(:value)
          end
        end
      end
    end
  end
end
