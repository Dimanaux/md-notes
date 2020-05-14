module Notes
  class Unrate
    include Interactor::Organizer

    organize Ratings::Destroy, UpdateRating
  end
end
