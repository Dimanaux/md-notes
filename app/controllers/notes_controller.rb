class NotesController < ApplicationController
  expose :notes, :fetch_notes

  def index
    render "users/notes/index"
  end

  private

  def fetch_notes
    Note.order(:created_at).page params[:page]
  end
end
