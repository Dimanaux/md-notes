module Notes
  class Find
    def initialize(params)
      @params = params
    end

    def self.call(params)
      new(params.with_indifferent_access).call
    end

    def call
      notes.recent.page @params[:page]
    end

    private

    def notes
      return Note if @params[:query].blank?

      notes_ids = PgSearch.multisearch(@params[:query]).pluck(:searchable_id)
      Note.where(id: notes_ids)
    end
  end
end
