module Notes
  class Rate
    include Interactor::Organizer

    organize Ratings::Find, Ratings::Save, UpdateRating
  end
end
