class NotesController < ApplicationController
  expose_decorated :notes, :find_notes

  def index
    render "users/notes/index"
  end

  private

  def find_notes
    NotesQuery.call(notes_params[:search_form])
  end

  def notes_params
    params.permit(:page, search_form: [:query])
  end
end
