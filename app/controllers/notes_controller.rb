class NotesController < ApplicationController
  expose_decorated :notes, :filtered_notes

  def index
    render "users/notes/index"
  end

  private

  def filtered_notes
    FilteredNotesQuery.new(raw_notes, filter_params).all.page(params[:page])
  end

  def raw_notes
    Note.includes(:author)
  end

  def filter_params
    params.require(:search_form).permit(:query).to_h
  end
end
