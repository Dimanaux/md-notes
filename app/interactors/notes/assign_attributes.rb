module Notes
  class AssignAttributes
    include Interactor

    delegate :note, :note_params, to: :context

    def call
      note.assign_attributes(note_params)

      raise_error if note.invalid?
    end

    private

    def raise_error
      context.fail!(error: note.errors.full_messages.join(", "))
    end
  end
end
