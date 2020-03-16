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
      note.errors.add(:title, I18n.t(".notes.save.errors.title"))
      context.fail!(error: I18n.t(".notes.save.errors.title"))
    end
  end
end
