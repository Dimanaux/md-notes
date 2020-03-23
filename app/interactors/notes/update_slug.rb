module Notes
  class UpdateSlug
    include Interactor

    delegate :note, to: :context

    def call
      note.update(slug: slug) || raise_error
    end

    private

    def slug
      note.title.parameterize
    end

    def raise_error
      context.fail!(error: note.errors.full_messages.join(", "))
    end
  end
end
