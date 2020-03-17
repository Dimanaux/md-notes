module Notes
  class Create
    include Interactor::Organizer

    organize Notes::UpdateSlug
  end
end
