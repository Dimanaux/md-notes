module Users
  class NotesController < AuthorizedController
    skip_before_action :authenticate_user!, only: %i[index show]
    skip_verify_authorized only: %i[index show]
    skip_before_action :authorize_resource!, only: %i[index show]

    expose_decorated :note, find_by: :slug, parent: :user
    expose_decorated :notes, :user_notes
    expose :user, find_by: :username

    def index
    end

    def show
      respond_to do |format|
        format.html { respond_with note.author, note }
        format.pdf do
          pdf_note = PdfNote.new(HtmlNote.new(note))
          send_data(pdf_note.content, filename: pdf_note.filename)
        end
      end
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
