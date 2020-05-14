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
            ::Notes::Rate.call(rating: rating)

            respond_with note.reload, location: root_path
          end

          def destroy
            ::Notes::Unrate.call(rating: rating)

            respond_with :api, :v1, user, note, rating
          end

          private

          def rating_params
            params.require(:rating).permit(:value).merge(user: current_user)
          end

          def authorize_resource!
            authorize! rating
          end
        end
      end
    end
  end
end
