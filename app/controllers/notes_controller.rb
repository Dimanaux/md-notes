class NotesController < ApplicationController
  expose :notes, -> { find_notes }

  def index
    render "users/notes/index"
  end

  private

  def find_notes
    PgSearch.multisearch(params[:query])
  end
end
