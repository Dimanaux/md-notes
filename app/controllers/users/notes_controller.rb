module Users
  class NotesController < ApplicationController
    expose :note, :fetch_note
    expose :notes, from: :user
    expose :user, :fetch_user

    def index
    end

    def show
      self.note = fetch_note
    end

    def new
      self.note = Note.new
    end

    def edit
      self.note = fetch_note
    end

    def create
      self.note = Note.new(note_params.merge(user: current_user))
      Notes::Save.call(note: note)
      respond_with note.user, note
    end

    def update
      note.assign_attributes(note_params.merge(user: current_user))
      Notes::Save.call(note: note)
      respond_with note.user, note
    end

    def destroy
      note.destroy
      respond_with note, location: -> { user_notes_path(user) }
    end

    private

    def fetch_note
      user.notes.find_by(slug: params[:slug])
    end

    def fetch_user
      User.find_by(username: params[:user_username])
    end

    def note_params
      if params.key?(:note)
        params.require(:note).permit(:title, :content, :slug)
      else
        params.permit(:user_username, :slug)
      end
    end
  end
end
