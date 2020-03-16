class NotesController < ApplicationController
  expose :notes, -> { Note.all }

  def index
    render "users/notes/index"
  end
end
