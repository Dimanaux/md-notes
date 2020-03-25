module Notes
  class Rate
    include Interactor::Organizer

    organize Ratings::AssignAttributes, Ratings::Save, UpdateRating
  end
end
