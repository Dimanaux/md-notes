class NotesController < ApplicationController
  expose :notes, -> { find_notes }

  def index
    render "users/notes/index"
  end

  private

  def find_notes
    ::Notes::Find.new(note_params[:note]).call
  end

  def note_params
    params.permit(note: [:title, :content])
  end
end
