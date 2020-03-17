module Notes
  class Update
    include Interactor::Organizer

    organize Notes::AssignAttributes,
      Notes::UpdateSlug
  end
end
