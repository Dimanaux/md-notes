class FilteredNotesQuery
  def initialize(params)
    @params = params || {}
  end

  def self.call(params)
    new(params).call
  end

  def call
    notes.recent.page @params[:page]
  end

  private

  def notes
    notes = Note.includes(:author)
    return notes if @params[:query].blank?

    notes_ids = PgSearch.multisearch(@params[:query]).pluck(:searchable_id)
    notes.where(id: notes_ids)
  end
end
