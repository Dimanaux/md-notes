module Users
  class NotesController < AuthorizedController
    skip_before_action :authenticate_user!, only: %i[index show]
    skip_verify_authorized only: %i[index show]
    skip_before_action :authorize_resource!, only: %i[index show]

    expose :note, find_by: :slug, parent: :user
    expose_decorated :notes, :user_notes
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

    def authorize_resource!
      byebug
      authorize! note
    end

    def user_notes
      user.notes.recent.page params[:page]
    end

    def note_params
      params.require(:note).permit(:title, :content, :slug)
    end
  end
end
