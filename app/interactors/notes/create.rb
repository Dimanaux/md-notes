module Notes
  class Create
    include Interactor

    before :set_slug
    after :fail_if_errors

    delegate :user, :note=, :note, to: :context

    def call
      self.note = Note.new(context.to_h.slice(:title, :content, :user))
      note.slug = @slug
      note.save
    end

    private

    def set_slug
      @slug = context.title.parameterize
    end

    def fail_if_errors
      return if note.persisted?

      context.fail!(error: 'You already have note with similar title')
    end
  end
end
