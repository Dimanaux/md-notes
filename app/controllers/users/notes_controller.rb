module Users
  class NotesController < ApplicationController
    expose_decorated :note, find_by: :slug, parent: :user
    expose :notes, from: :user
    expose :user, find_by: :username

    def index
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
      ::Notes::Create.call(note: note)

      respond_with note.author, note
    end

    def update
      ::Notes::Update.call(note: note, note_params: note_params)

      respond_with note.author, note
    end

    def destroy
      note.destroy

      respond_with note.author, note
    end

    private

    def note_params
      params.require(:note).permit(:title, :content, :slug)
    end
  end
end
