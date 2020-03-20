module Users
  module Notes
    class RatingsController < ApplicationController
      expose :user, find_by: :username # author
      expose :note, find_by: :slug, parent: :user
      expose :ratings, from: :note
      expose :rating, parent: :note

      respond_to :json

      def index
        respond_with ratings
      end

      # /users/:username/notes/:slug/rating
      def create
        ::Notes::Ratings::Create.call(rating: rating, user: current_user)

        respond_with user, note, rating
      end

      def update
        ::Notes::Ratings::Update.call(rating: rating)

        respond_with rating
      end

      def destroy
        ::Notes::Ratings::Destroy.call(rating: rating)

        respond_with rating
      end

      private

      def rating_params
        params.require(:rating).permit(:note_id, :value)
      end
    end
  end
end
