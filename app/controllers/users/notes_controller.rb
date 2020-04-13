module Users
  class NotesController < ApplicationController
    expose :note, find_by: :slug, parent: :user
    expose_decorated :notes, :filtered_notes
    expose :user, find_by: :username

    helper_method :filter_params

    def index
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
      Notes::Create.call(note: note)

      respond_with note.author, note
    end

    def update
      Notes::Update.call(note: note, note_params: note_params)

      respond_with note.author, note
    end

    def destroy
      note.destroy

      respond_with note.author, note
    end

    private

    def filtered_notes
      FilteredNotesQuery.new(raw_notes, filter_params)
        .all.recent.page(params[:page])
    end

    def raw_notes
      user.notes
    end

    def filter_params
      params.permit(search_form: [:query])[:search_form].to_h
    end

    def note_params
      params.require(:note).permit(:title, :content, :slug)
    end
  end
end
