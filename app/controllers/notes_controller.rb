class NotesController < ApplicationController
  expose :notes, -> { find_notes }

  def index
    render "users/notes/index"
  end

  private

  def find_notes
    Note.find(PgSearch.multisearch(params[:query]).pluck(:searchable_id))
  end
end
