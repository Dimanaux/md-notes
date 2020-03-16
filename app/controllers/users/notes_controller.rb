module Users
  class NotesController < ApplicationController
    expose :note, parent: :user
    expose :notes, from: :user
    expose :user, :fetch_user

    def index
    end

    def show
      self.note = fetch_note
    end

    def new
    end

    def edit
      self.note = fetch_note
    end

    def create
      note.assign_attributes(note_params.merge(user: current_user))
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
      redirect_to user_notes_url(note.user), notice: 'Note was successfully destroyed.'
    end

    private

    def fetch_note
      user.notes.find_by(slug: params[:slug])
    end

    def fetch_user
      User.find_by(username: params[:user_username])
    end

    def note_params
      params.require(:note).permit(:title, :content, :slug)
    end
  end
end
