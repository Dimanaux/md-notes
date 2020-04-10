module Notes
  class Find
    def call(params)
      notes_ids = PgSearch.multisearch(params[:query]).pluck(:searchable_id)
      Note.where(id: notes_ids)
    end
  end
end
