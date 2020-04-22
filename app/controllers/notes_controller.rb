class NotesController < ApplicationController
  expose_decorated :notes, :filtered_notes

  helper_method :filter_params

  def index
    render "users/notes/index"
  end

  private

  def filtered_notes
    FilteredNotesQuery.new(raw_notes, filter_params).all
  end

  def raw_notes
    Note.includes(:author)
  end

  def filter_params
    params.fetch(:search_form, {}).permit(:query).to_h
  end
end
