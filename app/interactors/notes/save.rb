module Notes
  class Save
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
      context.fail!(error: 'You already have note with similar title')
    end
  end
end
