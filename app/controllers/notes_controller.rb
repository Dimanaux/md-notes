class NotesController < ApplicationController
  expose_decorated :notes, :find_notes

  def index
    render "users/notes/index"
  end

  private

  def find_notes
    Notes::Find.call(params.slice(:query, :page))
  end
end
