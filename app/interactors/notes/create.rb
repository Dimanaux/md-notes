module Notes
  class Create
    include Interactor::Organizer

    organize UpdateSlug, Subscriptions::Notify
  end
end
