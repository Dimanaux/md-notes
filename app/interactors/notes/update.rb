module Notes
  class Update
    include Interactor::Organizer

    organize AssignAttributes, UpdateSlug
  end
end
