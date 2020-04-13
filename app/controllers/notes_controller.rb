class NotesController < ApplicationController
  expose_decorated :notes, :filtered_notes

  helper_method :filter_params

  def index
    render "users/notes/index"
  end

  private

  def filtered_notes
    FilteredNotesQuery.new(raw_notes, filter_params)
                      .all.recent.page(params[:page])
  end

  def raw_notes
    Note.includes(:author)
  end

  def filter_params
    params.permit(search_form: [:query])[:search_form].to_h
  end
end
