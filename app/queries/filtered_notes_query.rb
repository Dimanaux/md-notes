class FilteredNotesQuery
  ALLOWED_PARAMS = %i[query].freeze

  attr_reader :relation, :filter_params
  private :relation, :filter_params

  def initialize(relation, filter_params = {})
    @relation = relation
    @filter_params = filter_params
  end

  def all
    filter_params.slice(*ALLOWED_PARAMS).reduce(relation) do |relation, (key, value)|
      next relation if value.blank?

      send("by_#{key}", relation, value)
    end
  end

  private

  def by_query(relation, query)
    note_ids = PgSearch.multisearch(query).pluck(:searchable_id)

    relation.where(id: note_ids)
  end
end
