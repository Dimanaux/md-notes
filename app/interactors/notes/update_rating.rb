module Notes
  class UpdateRating
    include Interactor

    def call
      note.update(average_rating: note.ratings.average(:value))
    end

    private

    def note
      @note ||= context.note || context.rating.note
    end
  end
end
