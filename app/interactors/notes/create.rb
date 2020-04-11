module Notes
  class Create
    include Interactor::Organizer

    organize Notes::UpdateSlug, Subscriptions::Notify
  end
end
