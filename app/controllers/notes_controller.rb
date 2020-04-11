class NotesController < ApplicationController
  expose_decorated :notes, :find_notes

  def index
    render "users/notes/index"
  end

  private

  def find_notes
    Notes::Find.call(notes_params.to_h)
  end

  def notes_params
    params.permit(:query, :page)
  end
end
