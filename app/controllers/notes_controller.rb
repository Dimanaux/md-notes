class NotesController < ApplicationController
  expose :notes, :fetch_notes

  before_action :authorize!

  def index
    render "users/notes/index"
  end

  private

  def fetch_notes
    Note.recent.page params[:page]
  end
end
